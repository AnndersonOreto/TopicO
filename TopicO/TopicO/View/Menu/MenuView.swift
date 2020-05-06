//
//  MenuView.swift
//  TopicO
//
//  Created by Arthur Bastos Fanck on 05/05/20.
//  Copyright © 2020 Annderson Packeiser Oreto. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    
    @State var searchQuery: String = ""
    @State var showResults: Bool = false
    @State var isNavigationBarHidden: Bool = true
    
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text("Ótimo, \nvamos começar!")
                .font(.system(.largeTitle))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.top)
            Spacer().frame(height: height*0.017)
            SearchBar(text: $searchQuery)
                .padding(.horizontal)
                .onTapGesture {
                    self.showResults = true
                }
            NavigationLink(destination: SearchResultsView(searchQuery: self.searchQuery), isActive: self.$showResults) { Text("") }//.hidden()
            Spacer().frame(height: height*0.08)
            Text("Suas sugestões")
                .padding(.leading)
                .font(.system(.title))
                .foregroundColor(Color.purpleLargeText)
                .alignmentGuide(HorizontalAlignment.center) { (vd) in
                    vd[.trailing]
                }
            RecommendedView()
            Spacer().frame(height: height*0.055)
            Text("Confira também")
                .padding(.leading)
                .font(.system(.title))
                .foregroundColor(Color.purpleLargeText)
                .alignmentGuide(HorizontalAlignment.center) { (vd) in
                    vd[.trailing]
                }
            TagListView()
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

extension MenuView {
    var background: some View {
        ZStack {
            Rectangle()
                .fill(Color.clear)
            CustomShape()
                .fill(Color.purpleShape)
        }.edgesIgnoringSafeArea(.vertical)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
