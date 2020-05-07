//
//  TagListView.swift
//  TopicO
//
//  Created by Arthur Bastos Fanck on 05/05/20.
//  Copyright © 2020 Annderson Packeiser Oreto. All rights reserved.
//

import SwiftUI

struct TagListView: View {
    
    @State var tag_array: [Tag]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                ForEach(tag_array) { tag in
                    NavigationLink(destination: DetailView(tag: tag)) {
                        TagRow(image: tag.image, text: tag.name)
                    }.buttonStyle(PlainButtonStyle())
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
                .font(.custom("Jost", size: 18)).fontWeight(.regular)
                .padding(.trailing)
                .foregroundColor(Color.purpleNormalText)
            Spacer()
        }.frame(height: self.width*0.24)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .shadow, radius: 10, x: 2, y: 2)
    }
}
