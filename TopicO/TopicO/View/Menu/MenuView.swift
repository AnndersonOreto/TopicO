//
//  MenuView.swift
//  TopicO
//
//  Created by Arthur Bastos Fanck on 05/05/20.
//  Copyright © 2020 Annderson Packeiser Oreto. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    
    @ObservedObject var viewModel = MenuViewModel()
    
    // Core Data ---------------------------------------------------------------------------------------------\\
    //
    @FetchRequest(entity: TagViewed.entity(), sortDescriptors: []) var tagsViewed: FetchedResults<TagViewed>
    @Environment(\.managedObjectContext) var moc
    //
    // Core Data ---------------------------------------------------------------------------------------------//
    
    @State var textSearched: String = ""
    @State var isNavigationBarHidden: Bool = true
    @State var isSearching: Bool = false
    
    var itemsId: [Int]
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        
        ZStack() {
            
            VStack(spacing: 0) {
                
                Image("img_shape")
                    .resizable()
                    .frame(width: width, height: isSearching ? height*0.16 : height*0.3)
                
                
                if isSearching {
                    
                    SearchResultsView(viewModel: viewModel, searchQuery: $textSearched)
                    
                } else {
                        
                    HStack {
                        Text("Suas sugestões")
                            .font(.custom("Jost", size: 25)).fontWeight(.medium)
                            .padding(.leading)
                            .foregroundColor(Color.purpleLargeText)
                        
                        Spacer()
                    }.padding(.top)
                    
                    RecommendedView(viewModel: viewModel)
                    
                    Spacer().frame(height: height*0.04)
                    
                    HStack {
                        Text("Confira também")
                            .font(.custom("Jost", size: 25)).fontWeight(.medium)
                            .padding(.leading)
                            .foregroundColor(Color.purpleLargeText)
                        
                        Spacer()
                    }
                    
                    TagListView(tag_array: viewModel.tag_array)
                        
                }
            }.edgesIgnoringSafeArea(.vertical)
            
            
            VStack {
                
                if !isSearching {
                    Text("Ótimo, \nvamos começar!")
                    .font(.custom("Jost", size: 35)).fontWeight(.medium)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.top)
                }
                
                Spacer().frame(height: height*0.017)
                
                HStack {
                    
                    SearchBar(text: $textSearched, isSearching: $isSearching)
                    
                    if isSearching {
                        
                        Button(action: {
                            withAnimation {
                                self.isSearching.toggle()
                            }
                            
                            UIApplication.shared.endEditing()
                        }) {
                            Text("Cancel")
                                .foregroundColor(.white)
                        }
                    }
                }.padding(.horizontal)
                
                
                Spacer()
            }
            
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(isNavigationBarHidden)
        .onAppear {
            
            self.isNavigationBarHidden = true
            
            if self.viewModel.viewTagIds.isEmpty {
                for tagId in self.itemsId {
                    let tempTag = TagViewed(context: self.moc)
                    tempTag.id = Int64(tagId)
                    
                    try? self.moc.save()
                }
            }
            
            var array: [Int] = []
            
            for tag in self.tagsViewed {
                array.append(Int(tag.id))
            }
            
            self.viewModel.viewTagIds = array
            
            print(self.tagsViewed)
            
            self.viewModel.recommender()
        }
        .onDisappear {
            self.isNavigationBarHidden = false
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
        
    }
}

// MARK: - Previews
//struct MenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuView()
//    }
//}
