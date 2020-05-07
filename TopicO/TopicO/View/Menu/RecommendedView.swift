//
//  RecommendedView.swift
//  TopicO
//
//  Created by Arthur Bastos Fanck on 05/05/20.
//  Copyright © 2020 Annderson Packeiser Oreto. All rights reserved.
//

import SwiftUI

struct RecommendedView: View {
    
    @ObservedObject var viewModel = RecommendedViewModel()
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.tags) { tag in
                    TagCard(image: tag.image, text: tag.name)
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
                .aspectRatio(contentMode: .fill)
            Text(text)
                .padding([.horizontal, .bottom])
                .font(.system(.subheadline))
                .foregroundColor(Color.purpleNormalText)
                .lineLimit(2)
        }.frame(width: self.width*0.42)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .shadow, radius: 20, x: 2, y: 2)
    }
}

// MARK: - Previews
struct RecommendedView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedView()
    }
}
