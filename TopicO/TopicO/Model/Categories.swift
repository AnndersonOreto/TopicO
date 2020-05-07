//
//  Categories.swift
//  TopicO
//
//  Created by Annderson Packeiser Oreto on 06/05/20.
//  Copyright © 2020 Annderson Packeiser Oreto. All rights reserved.
//

import Foundation

struct Categories: Hashable {
    
    var categoryId: Int
    var categoryName: String
    var categoryImage: String
}

let categories = [[Categories(categoryId: 500, categoryName: "Pessoal", categoryImage: "img_pessoal"),
                   Categories(categoryId: 501, categoryName: "Variadas", categoryImage: "img_variadas")],
                  [Categories(categoryId: 502, categoryName: "Casal", categoryImage: "img_casal"),
                   Categories(categoryId: 503, categoryName: "Filmes", categoryImage: "img_filmes")],
                  [Categories(categoryId: 504, categoryName: "Séries", categoryImage: "img_series"),
                   Categories(categoryId: 505, categoryName: "Músicas", categoryImage: "img_musicas")]]
