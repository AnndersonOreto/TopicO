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
    
    //Resize Shape variables
    static let maxHeight: CGFloat = UIScreen.main.bounds.height*0.33
    static let minHeight: CGFloat = UIScreen.main.bounds.height*0.16
    @State var currentHeight: CGFloat = MenuView.maxHeight
    
    @State var isScrollDisabled: Bool = true
    
    var itemsId: [Int]
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var hideText: Bool {
        withAnimation{
            return (self.currentHeight * 0.12) > 20 ? true : false
        }
    }
    
    var body: some View {
        
        ZStack(alignment: .top) {
            Rectangle()
                .fill(Color(red: 124/255, green: 61/255, blue: 246/255))
                .frame(width: width, height: 50)
            VStack(spacing: 0) {
                
                ZStack{
                    Image("img_shape")
                    .resizable()
                    .frame(
                        height: self.currentHeight
                    )
                    VStack {
                        if !isSearching {
                            if hideText {
                                Text("Ótimo, \nvamos começar!")
                                .font(.custom("Jost", size: 35)).fontWeight(.medium)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding(.top)
                            }
                        }
                        
                        Spacer().frame(height: height*0.02)
                        
                        HStack {
                            
                            SearchBar(text: $textSearched, isSearching: $isSearching, shapeHeight: $currentHeight)
                            
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
                    }
                }
                
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
                        .disabled(self.isScrollDisabled)
                }
            }
            
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(isNavigationBarHidden)
        .edgesIgnoringSafeArea(.vertical)
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
            
            self.viewModel.recommender()
        }
        .onDisappear {
            self.isNavigationBarHidden = false
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
        .gesture(
        DragGesture()
            .onChanged({ gesture in
                
                let deltaY = gesture.translation.height
                
                if deltaY > 0 {
                    withAnimation {
                        self.currentHeight = min(MenuView.maxHeight, self.currentHeight + deltaY)
                    }
                } else {
                    withAnimation {
                        self.currentHeight = max(MenuView.minHeight, self.currentHeight + deltaY)
                    }
                }
                
            })
        .onEnded { gesture in
            
            let deltaY = gesture.translation.height
            
            if deltaY > 0 {
                withAnimation {
                    self.currentHeight = min(MenuView.maxHeight, self.currentHeight + deltaY)
                }
            } else {
                withAnimation {
                    self.currentHeight = max(MenuView.minHeight, self.currentHeight + deltaY)
                }
            }
            
            if self.currentHeight == MenuView.minHeight {
                self.isScrollDisabled = false
            } else {
                self.isScrollDisabled = true
            }
        })
    }
}

// MARK: - Previews
//struct MenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuView()
//    }
//}
