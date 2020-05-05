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
    
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                ForEach(viewModel.tags) { tag in
                    HStack(alignment: .center) {
                        Image(tag.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                        Text(tag.name)
                            .frame(maxWidth: .infinity)
                            .padding(.trailing)
                            .foregroundColor(Color.purpleNormalText)
                    }.frame(height: self.width*0.24)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: .shadow, radius: 20, x: 2, y: 2)
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
