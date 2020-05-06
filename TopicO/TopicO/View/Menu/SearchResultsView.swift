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
    @State var searchQuery: String
    @State var isHidden: Bool = false
    
    var body: some View {
        VStack {
            SearchBar(text: $searchQuery)
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(viewModel.tags.filter({ tag in
                    tag.name.contains(self.searchQuery.lowercased()) || self.searchQuery == ""
                })) { tag in
                    TagRow(image: tag.image, text: tag.name)
                }
            }
        }.padding([.top, .horizontal])
    }
}

struct SearchResultsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsView(searchQuery: "")
    }
}
