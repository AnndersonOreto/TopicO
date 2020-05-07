//
//  SelectionOnboardingView.swift
//  TopicO
//
//  Created by Annderson Packeiser Oreto on 06/05/20.
//  Copyright © 2020 Annderson Packeiser Oreto. All rights reserved.
//

import SwiftUI

struct SelectionOnboardingView: View {
    
    @State var selectedRows = Set<String>()
    
    var body: some View {
        
        // Main structure
        ZStack {
            
            // Auxiliary geometry tools
            GeometryReader { geometry in
                
                // First section labels
                VStack {
                    
                    // Title label
                    Text("Primeiro, personalize seu feed")
                        .font(.custom("Jost", size: 35)).fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 23/255, green: 11/255, blue: 91/255))
                        .padding(32)
                    
                    // Description label
                    Text("Selecione o que tens interesse:")
                        .font(.custom("Jost", size: 20)).fontWeight(.regular)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .padding(16)
                    
                    // Stack used to place confirmation button over the scroll view
                    ZStack {
                        
                        ScrollView {
                            
                            VStack(spacing: 15) {
                                
                                ForEach(categories, id: \.self) { row in
                                    
                                    HStack(spacing: 15) {
                                        
                                        ForEach(row, id: \.self) { item in
                                            
                                            OnboardingSelectionButton(category: item, selectedItems: self.$selectedRows)
                                        }
                                    }
                                }
                            }.padding(.horizontal, 32)
                                .padding(.top, 16)
                        }
                        
                        // Stack to handle button position
                        VStack {
                            
                            Spacer()
                            
                            // Confirmation button
                            Button(action: {
                                
                            }) {
                                
                                // Button properties content
                                HStack(spacing: 20) {
                                    
                                    // Button text
                                    Text("Feito")
                                        .font(.custom("Jost", size: 20)).fontWeight(.medium)
                                    Image(systemName: "arrow.right")
                                }
                            }.buttonStyle(OnboardingButtonStyle())
                        }.padding(.bottom)
                    }
                }
            }
        }
    }
}

struct SelectionOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionOnboardingView()
    }
}
