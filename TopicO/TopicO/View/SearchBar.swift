//
//  SearchBar.swift
//  TopicO
//
//  Created by Arthur Bastos Fanck on 05/05/20.
//  Copyright © 2020 Annderson Packeiser Oreto. All rights reserved.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "magnifyingglass")
            .foregroundColor(.darkGraySearchBar)
            .padding(.leading)
            TextField("Buscar", text: $text).padding([.vertical, .trailing])
            if text != "" {
                Button(action: {
                    self.text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .padding(.trailing)
                        .foregroundColor(.darkGraySearchBar)
                }
            }
        }.background(RoundedRectangle(cornerRadius: 100).fill(Color.white))
    }
}
