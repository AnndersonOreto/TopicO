//
//  RecommendedViewModel.swift
//  TopicO
//
//  Created by Arthur Bastos Fanck on 05/05/20.
//  Copyright © 2020 Annderson Packeiser Oreto. All rights reserved.
//

import Foundation

class RecommendedViewModel: ObservableObject {
    
    @Published var tags: [Tag]
    
    init() {
        let tag0 = Tag(id: 0, name: "13 perguntas sobre 13 reasons why", image: "default", questions: [])
        let tag1 = Tag(id: 1, name: "50 perguntas sobre Harry Potter", image: "default", questions: [])
        let tag2 = Tag(id: 2, name: "15 coisas estranhas sobre mim", image: "default", questions: [])
        self.tags = [tag0, tag1, tag2]
    }
}
