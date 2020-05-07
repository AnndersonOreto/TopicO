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
    //@State var searchQuery: String = ""
    @State var isNavigationBarHidden: Bool = true
    
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Ótimo, \nvamos começar!")
                .font(.custom("Jost", size: 35)).fontWeight(.medium)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.top)
            Spacer().frame(height: height*0.017)
            
            NavigationLink(destination: SearchResultsView()) {
                SearchFakeButton()
                    .padding(.horizontal)
            }.buttonStyle(PlainButtonStyle())
            
            Spacer().frame(height: height*0.08)
            HStack {
                Text("Suas sugestões")
                    .font(.custom("Jost", size: 25)).fontWeight(.medium)
                    .padding(.leading)
                    .foregroundColor(Color.purpleLargeText)
                
                Spacer()
            }
            RecommendedView(recommended_tag_array: viewModel.recommender_tag_array)
            Spacer().frame(height: height*0.04)
            HStack {
                Text("Confira também")
                    .font(.custom("Jost", size: 25)).fontWeight(.medium)
                    .padding(.leading)
                    .foregroundColor(Color.purpleLargeText)
                
                Spacer()
            }
            TagListView(tag_array: viewModel.tag_array)
        }.background(background)
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(isNavigationBarHidden)
            .onAppear {
                self.isNavigationBarHidden = true
        }
        .onDisappear {
            self.isNavigationBarHidden = false
        }
        
    }
}

// MARK: - Extension
extension MenuView {
    
    // MARK: background view
    var background: some View {
        ZStack {
            Rectangle()
                .fill(Color.clear)
            CustomShape()
                .fill(Color.purpleShape)
        }.edgesIgnoringSafeArea(.vertical)
    }
}

// MARK: - Previews
struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
