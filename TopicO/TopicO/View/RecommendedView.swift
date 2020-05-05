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
    
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.tags) { tag in
                    VStack {
                        Image(tag.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        Text(tag.name)
                            .padding([.horizontal, .bottom])
                            .font(.system(.subheadline))
                            .foregroundColor(Color.purpleNormalText)
                            .lineLimit(2)
                    }.frame(width: self.width*0.42)
                    .background(Color.white)
                    .cornerRadius(10)
                        .shadow(color: .shadow, radius: 20, x: 2, y: 2)
                }
            }.padding(.all)
        }
    }
}

struct RecommendedView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedView()
    }
}
