//
//  ContentView.swift
//  TopicO
//
//  Created by Annderson Packeiser Oreto on 30/04/20.
//  Copyright © 2020 Annderson Packeiser Oreto. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                // If user has not entered for the first time
                if (UserDefaults.standard.value(forKey: "isFirstLogin") != nil) {
                    
                    // Main screen
                    MenuView(itemsId: [])
                } else {
                    
                    // Onboarding screen
                    OnboardingStart()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
