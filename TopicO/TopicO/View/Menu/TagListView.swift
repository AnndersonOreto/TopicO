//
//  TagListView.swift
//  TopicO
//
//  Created by Arthur Bastos Fanck on 05/05/20.
//  Copyright © 2020 Annderson Packeiser Oreto. All rights reserved.
//

import SwiftUI

struct TagListView: View {
    
    @ObservedObject var viewModel = RecommendedViewModel()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                ForEach(viewModel.tags) { tag in
                    TagRow(image: tag.image, text: tag.name)
                }.padding(.horizontal)
            }.padding(.vertical)
        }
    }
}

struct TagListView_Previews: PreviewProvider {
    static var previews: some View {
        TagListView()
    }
}
