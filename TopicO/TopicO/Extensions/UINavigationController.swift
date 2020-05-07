//
//  UINavigationController.swift
//  TopicO
//
//  Created by Arthur Bastos Fanck on 06/05/20.
//  Copyright © 2020 Annderson Packeiser Oreto. All rights reserved.
//

import SwiftUI

extension UINavigationController {
    
    open override func viewDidLoad() {
        let newAppearance = UINavigationBarAppearance()
        newAppearance.configureWithTransparentBackground()
        
        navigationBar.standardAppearance = newAppearance
        navigationBar.scrollEdgeAppearance = newAppearance
        navigationBar.compactAppearance = newAppearance
    }
}
