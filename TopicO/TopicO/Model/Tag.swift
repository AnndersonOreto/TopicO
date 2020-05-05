//
//  Tag.swift
//  TopicO
//
//  Created by Marcus Vinicius Vieira Badiale on 05/05/20.
//  Copyright © 2020 Annderson Packeiser Oreto. All rights reserved.
//

import Foundation


class Tag {
    var id: Int
    var name: String
    var image: String
    var questions: [String]
    
    init() {
        self.id = 0
        self.name = ""
        self.image = ""
        self.questions = []
    }
    
    init(id: Int, name: String, image: String, questions: [String]) {
        self.id = id
        self.name = name
        self.image = image
        self.questions = questions
    }
}
