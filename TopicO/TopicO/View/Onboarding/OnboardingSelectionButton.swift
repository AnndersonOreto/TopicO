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
    @Binding var selectedItems: Set<Int>
    
    var isSelected: Bool {
        selectedItems.contains(category.categoryId)
    }
    
    var body: some View {
        
        Button(action: {
            
            if self.isSelected {
                self.selectedItems.remove(self.category.categoryId)
            } else {
                self.selectedItems.insert(self.category.categoryId)
            }
            
        }) {
            VStack {
                
                Image(self.category.categoryImage)
                    .resizable()
                
                if self.isSelected {
                    Text(self.category.categoryName)
                        .font(.system(size: 18))
                        .fontWeight(.regular)
                        .foregroundColor(.purple)
                        .padding(.bottom)
                } else {
                    Text(self.category.categoryName)
                        .font(.system(size: 18))
                        .fontWeight(.regular)
                        .foregroundColor(Color("DarkPurple"))
                        .padding(.bottom)
                }
            }.background(Color("CellBackground"))
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
