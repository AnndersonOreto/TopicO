//
//  RecommendedView.swift
//  TopicO
//
//  Created by Arthur Bastos Fanck on 05/05/20.
//  Copyright © 2020 Annderson Packeiser Oreto. All rights reserved.
//

import SwiftUI

struct RecommendedView: View {
    
    @ObservedObject var viewModel: MenuViewModel
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                
                if viewModel.recommender_tag_array.isEmpty {
                    Text("Suas sugestões acabaram 😅😅")
                    .font(.custom("Jost", size: 20)).fontWeight(.regular)
                    .foregroundColor(Color("purpleNormalText"))
                } else{
                    ForEach(viewModel.recommender_tag_array) { tag in
                        NavigationLink(destination: DetailView(tag: tag)) {
                            TagCard(image: tag.image, text: tag.name)
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
            }.padding(.all)
        }
    }
}

// MARK: - TagCard
struct TagCard: View {
    
    @State var image: String
    @State var text: String
    
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(text)
                .font(.custom("Jost", size: 18)).fontWeight(.regular)
                .padding([.bottom])
                .foregroundColor(Color("purpleNormalText"))
                .lineLimit(2)
        }.frame(width: self.width*0.42)
        .background(Color("CellBackground"))
        .cornerRadius(10)
        .shadow(color: .shadow, radius: 10, x: 2, y: 2)
    }
}
