//
//  OnboardingButtonStyle.swift
//  TopicO
//
//  Created by Marcus Vinicius Vieira Badiale on 05/05/20.
//  Copyright © 2020 Annderson Packeiser Oreto. All rights reserved.
//

import Foundation
import SwiftUI

struct OnboardingButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
        .frame(width: UIScreen.main.bounds.width * 0.87, height: UIScreen.main.bounds.width * 0.14)
        .background(Color(red: 134/255, green: 57/255, blue: 255/255))
        .foregroundColor(Color.white)
        .cornerRadius(16)
        .contentShape(RoundedRectangle(cornerRadius: 8))
    }
}
