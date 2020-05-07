//
//  SearchResultsView.swift
//  TopicO
//
//  Created by Arthur Bastos Fanck on 06/05/20.
//  Copyright © 2020 Annderson Packeiser Oreto. All rights reserved.
//

import SwiftUI

struct SearchResultsView: View {
    
    @ObservedObject var viewModel = RecommendedViewModel()
    @State var searchQuery: String = ""
    @State var isHidden: Bool = false
    
    var body: some View {
        VStack {
            
            SearchBar(text: $searchQuery)
            .overlay(
                RoundedRectangle(cornerRadius: 100)
                    .stroke()
                    .foregroundColor(.lightGraySearchBar)
            )
            .padding([.bottom, .horizontal])
            
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(viewModel.tags.filter({ tag in
                    tag.name.lowercased().contains(self.searchQuery.lowercased())
                })) { tag in
                    TagRow(image: tag.image, text: tag.name)
                }.padding([.top, .horizontal])
            }
            
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(false)
    }
}

struct SearchResultsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsView(searchQuery: "")
    }
}
