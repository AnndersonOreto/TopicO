//
//  MenuViewModel.swift
//  TopicO
//
//  Created by Annderson Packeiser Oreto on 07/05/20.
//  Copyright © 2020 Annderson Packeiser Oreto. All rights reserved.
//

import Foundation

class MenuViewModel: ObservableObject {
    
    // All tags
    var tag_array: [Tag] = []
    
    // Machine Learning recommended tags
    var recommender_tag_array: [Tag] = []
    
    init() {
        
        // Fetch all tags
        fetchTagArray()
        
        // Fetch recommended tags
        fetchRecommenderTagArray()
    }
    
    func fetchTagArray() {
        
        if let array = Parsing.parseTagsJson() {
            
            self.tag_array = array
            self.recommender_tag_array = array
        }
    }
    
    func fetchRecommenderTagArray() {
        
    }
}
