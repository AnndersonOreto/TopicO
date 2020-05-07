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

let categories = [
                  [Categories(categoryName: "Question", categoryImage: "teste"), Categories(categoryName: "Game", categoryImage: "teste")],
                  [Categories(categoryName: "Individual", categoryImage: "teste"), Categories(categoryName: "Group", categoryImage: "teste")],
                  [Categories(categoryName: "Adult", categoryImage: "teste"), Categories(categoryName: "Children", categoryImage: "teste")]]
    
//    , "women",
//                  "adult", "children",
//                  "question", "game",
//                  "individual", "group",
//                  "couples", "family",
//                  "miscelaneous", "other"]
