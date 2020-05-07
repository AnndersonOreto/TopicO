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

// MARK: - TagRow
struct TagRow: View {
    
    @State var image: String
    @State var text: String
    
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        HStack(alignment: .center) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
            Text(text)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.trailing)
                .foregroundColor(Color.purpleNormalText)
        }.frame(height: self.width*0.24)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .shadow, radius: 20, x: 2, y: 2)
    }
}

// MARK: - Previews
struct TagListView_Previews: PreviewProvider {
    static var previews: some View {
        TagListView()
    }
}
