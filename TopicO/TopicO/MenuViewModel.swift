//
//  MenuViewModel.swift
//  TopicO
//
//  Created by Annderson Packeiser Oreto on 07/05/20.
//  Copyright © 2020 Annderson Packeiser Oreto. All rights reserved.
//

import SwiftUI

class MenuViewModel: ObservableObject {
    
    // All tags
    @Published var tag_array: [Tag] = []
    
    // Machine Learning recommended tags
    @Published var recommender_tag_array: [Tag] = []
    
    @Published var viewTagIds: [Int] = []
    
    var excludeTags: [Int64] = [500, 501, 502, 503, 504, 505]
    
    // Input items for recommender
    var items = [Int64: Double]()
    
    init() {
        
        // Fetch all tags
        fetchTagArray()
    }
    
    func fetchTagArray() {
        
        if let array = Parsing.parseTagsJson() {
            
            self.tag_array = array
        }
    }
    
    func recommender() {
        
        for item in viewTagIds {
            let tempItem = Int64(item)
            excludeTags.append(tempItem)
            self.items.updateValue(10, forKey: tempItem)
        }
        
        load()
    }
    
    func load() {
        
        do{
            let recommender = TagCategoryRecommender()
            let input = TagCategoryRecommenderInput(items: items, k: 4, restrict_: [], exclude: excludeTags)
            
            let result = try recommender.prediction(input: input)
            var tempIds = [Int]()
            
            for str in result.recommendations{
                let tempId = Int(truncatingIfNeeded: str)
                tempIds.append(tempId)
            }
            
            getTagById(tempIds)
            
        }catch(let error){
            print("error is \(error.localizedDescription)")
        }
    }
    
    func getTagById(_ ids: [Int]) {
        
        // PRECISA MELHORIA URGENTE!!! #SalvaAGenteRenan
        var tempArray: [Tag] = []
        
        for id in ids {
            for tag in tag_array {
                if tag.id == id {
                    tempArray.append(tag)
                }
            }
        }
        
        self.recommender_tag_array = tempArray
    }
}
