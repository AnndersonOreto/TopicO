//
//  SelectionOnboardingView.swift
//  TopicO
//
//  Created by Annderson Packeiser Oreto on 06/05/20.
//  Copyright © 2020 Annderson Packeiser Oreto. All rights reserved.
//

import SwiftUI

struct SelectionOnboardingView: View {
    
    @State var isActive: Bool = false
    @State var selectedRows = Set<Int>()
    @State var isNavigationBarHidden = true
    
    var body: some View {
        
        // Main structure
        ZStack {
            Color("Background")
            // Link to the main screen
            NavigationLink("", destination: MenuView(itemsId: Array(selectedRows)), isActive: $isActive)
            
            // Auxiliary geometry tools
            GeometryReader { geometry in
                
                // First section labels
                VStack {
                    
                    // Title label
                    Text("Primeiro, personalize seu feed")
                        .font(.custom("Jost", size: 35)).fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("DarkPurple"))
                        .padding(16)
                    
                    // Description label
                    Text("Selecione o que tens interesse:")
                        .font(.custom("Jost", size: 20)).fontWeight(.regular)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("gray_purple"))
                        .padding(8)
                        .padding(.top, 16)
                    
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
                                .padding(.bottom, 80)
                        }
                        
                        // Stack to handle button position
                        VStack {
                            
                            Spacer()
                            
                            // Confirmation button
                            Button(action: {
                                
                                self.isActive.toggle()
                                UserDefaults.standard.set(false, forKey: "isFirstLogin")
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
                }.padding(.top, 60)
                .padding(.bottom, 30)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(isNavigationBarHidden)
        .onAppear {
            self.isNavigationBarHidden = true
        }
        .onDisappear {
            self.isNavigationBarHidden = false
        }
    }
}

struct SelectionOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionOnboardingView()
    }
}
