//
//  SearchResultsView.swift
//  TopicO
//
//  Created by Arthur Bastos Fanck on 06/05/20.
//  Copyright © 2020 Annderson Packeiser Oreto. All rights reserved.
//

import SwiftUI

struct SearchResultsView: View {
    
    @ObservedObject var viewModel: MenuViewModel
    @Binding var searchQuery: String
    
    var body: some View {
        VStack {
            HStack {
                Text("Resultado")
                    .font(.custom("Jost", size: 25)).fontWeight(.medium)
                    .padding(.leading)
                    .foregroundColor(Color("purpleLargeText"))
                
                Spacer()
            }.padding(.top)
            
            // MARK: GAMBIARRA PRA SCROLL APARECER
            Text(searchQuery).foregroundColor(.clear)
            
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(viewModel.tag_array.filter({ (tag) in
                    tag.name.lowercased().contains(searchQuery)
                })) { tag in
                    NavigationLink(destination: DetailView(tag: tag)) {
                        TagRow(image: tag.image, text: tag.name)
                    }.buttonStyle(PlainButtonStyle())
                }
            }.padding(.horizontal)
        }
    }
}
