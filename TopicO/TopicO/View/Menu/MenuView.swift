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
    
    @State var testDrag = CGSize.zero
    @State var testResize: Bool = false
    
    //Resize Shape variables
    static let defaultHeight: CGFloat = UIScreen.main.bounds.height*0.16
    @State var heightDiff: CGFloat = 0.0
    @State var currentHeight: CGFloat = MenuView.defaultHeight
    
    var itemsId: [Int]
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
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
                        minHeight: UIScreen.main.bounds.height*0.03,
                        idealHeight: self.currentHeight + heightDiff,
                        maxHeight: UIScreen.main.bounds.height*0.16
                    )
                    VStack {
                        if !isSearching {
                            if !testResize {
                                Text("Ótimo, \nvamos começar!")
//                                0.24
                                .font(.custom("Jost", size: 35)).fontWeight(.medium)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding(.top)
                            }
                        }
                        
                        Spacer().frame(height: height*0.017)
                        
                        HStack {
                            
                            SearchBar(text: $textSearched, isSearching: $isSearching, resizeShape: $testResize)
                            
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
                    
                    Spacer().frame(height: testResize ? height*0.02: height*0.04)
                    
                    HStack {
                        Text("Confira também")
                            .font(.custom("Jost", size: 25)).fontWeight(.medium)
                            .padding(.leading)
                            .foregroundColor(Color.purpleLargeText)
                        
                        Spacer()
                    }
                    
                    TagListView(tag_array: viewModel.tag_array)
                        .disabled(testResize)
                        
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
                print("Changed")
                let location = gesture.location
                let startLocation = gesture.startLocation
                let deltaY = location.y - startLocation.y
                self.heightDiff = deltaY
                print("deltaY: ", deltaY)
                self.viewModel.delta = deltaY
            })
        .onEnded { gesture in
            print("Ended")
            let location = gesture.location
            let startLocation = gesture.startLocation
            let deltaY = location.y - startLocation.y
            self.currentHeight = max(MenuView.defaultHeight, self.currentHeight + deltaY)
            self.heightDiff = 0
            print("Ended", deltaY)
            print(String(describing: gesture))
        })
    }
}

// MARK: - Previews
//struct MenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        MenuView()
//    }
//}
