//
//  Parsing.swift
//  TopicO
//
//  Created by Marcus Vinicius Vieira Badiale on 06/05/20.
//  Copyright © 2020 Annderson Packeiser Oreto. All rights reserved.
//

import Foundation

class Parsing {
    
    static func parseTagsJson() -> [Tag]? {
        
        var tags: [Tag] = []
        
        do {
            if let file = Bundle.main.url(forResource: "tags-2", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String :Any] {
                    guard let root = object["tags"] as? [[String : Any]] else {return nil}
                    for dic in root {
                        guard let array = dic["array"] as? [String] else {return nil}
                        guard let tag_name = dic["tag_name"] as? String else {return nil}
                        guard let tag_id = dic["tag_id"] as? Int else {return nil}
                        guard let image_name = dic["image_name"] as? String else {return nil}
                        
                        let newTag = Tag(id: tag_id, name: tag_name, image: image_name, questions: array)
                        
                        tags.append(newTag)
                    }
                }
            }
            
        } catch {
            print(error.localizedDescription)
        }
        
        return tags
    }
}
