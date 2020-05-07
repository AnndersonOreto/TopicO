//
//  OnboardingSelectionButton.swift
//  TopicO
//
//  Created by Annderson Packeiser Oreto on 06/05/20.
//  Copyright © 2020 Annderson Packeiser Oreto. All rights reserved.
//

import SwiftUI

struct OnboardingSelectionButton: View {
    
    var category: Categories
    @Binding var selectedItems: Set<String>
    
    var isSelected: Bool {
        selectedItems.contains(category.categoryName)
    }
    
    var body: some View {
        
        Button(action: {
            
            if self.isSelected {
                self.selectedItems.remove(self.category.categoryName)
            } else {
                self.selectedItems.insert(self.category.categoryName)
            }
            
        }) {
            VStack {
                
                Image(self.category.categoryImage)
                
                if self.isSelected {
                    Text(self.category.categoryName)
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                        .foregroundColor(.purple)
                } else {
                    Text(self.category.categoryName)
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                }
            }
        }
        .overlay(
            Group {
                if self.isSelected {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.purple, lineWidth: 3)
                } else {
                    //                    RoundedRectangle(cornerRadius: 8)
                    //                        .stroke(Color.white, lineWidth: 2)
                }
            }
        )
            .buttonStyle(SelectionButtonStyle())
    }
}

struct SelectionButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.width * 0.4)
            .background(Color.white)
            .cornerRadius(8)
            .contentShape(RoundedRectangle(cornerRadius: 8))
            .shadow(color: Color.gray.opacity(0.2), radius: 8)
    }
}
