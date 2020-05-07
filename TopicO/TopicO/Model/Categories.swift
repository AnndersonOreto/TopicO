//
//  Categories.swift
//  TopicO
//
//  Created by Annderson Packeiser Oreto on 06/05/20.
//  Copyright © 2020 Annderson Packeiser Oreto. All rights reserved.
//

import Foundation

struct Categories: Hashable {
    
    var categoryName: String
    var categoryImage: String
}

let categories = [[Categories(categoryName: "men", categoryImage: "teste"), Categories(categoryName: "women", categoryImage: "teste")],
                  [Categories(categoryName: "question", categoryImage: "teste"), Categories(categoryName: "game", categoryImage: "teste")],
                  [Categories(categoryName: "individual", categoryImage: "teste"), Categories(categoryName: "group", categoryImage: "teste")],
                  [Categories(categoryName: "adult", categoryImage: "teste"), Categories(categoryName: "children", categoryImage: "teste")]]
    
//    , "women",
//                  "adult", "children",
//                  "question", "game",
//                  "individual", "group",
//                  "couples", "family",
//                  "miscelaneous", "other"]
