//
//  OnboardingStart.swift
//  TopicO
//
//  Created by Marcus Vinicius Vieira Badiale on 05/05/20.
//  Copyright © 2020 Annderson Packeiser Oreto. All rights reserved.
//

import SwiftUI

struct OnboardingStart: View {
    var body: some View {
        VStack{
            Image("img_ilustra")
                .resizable()
                .frame(width: getImageSize(isWidth: true), height: getImageSize(isWidth: false))
            VStack(spacing:30){
                Text("Random topics to talk about")
                    .font(.custom("Jost", size: 35)).fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 23/255, green: 11/255, blue: 91/255))
                Text("Neque porro quisquam est qui dolorem ipsum quia dolor sit amet.")
                    .font(.custom("Jost", size: 20)).fontWeight(.regular)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 130/255, green: 130/255, blue: 130/255))
            }.padding(.horizontal, 50)
            Spacer()
            Button(action: {
                //action
            }) {
                HStack(spacing: 20){
                   Text("Começar")
                    .font(.custom("Jost", size: 20)).fontWeight(.medium)
                    Image(systemName: "arrow.right")
                }
            }.buttonStyle(OnboardingButtonStyle())
        }
        .padding(.vertical)
        .padding(.top, 40)
    }
    
    func getImageSize(isWidth: Bool) -> CGFloat {
        var size: CGFloat
        
        if isWidth{
            size = UIScreen.main.bounds.width
        } else {
            size = UIScreen.main.bounds.width * 0.9
        }
        
        return size
    }
}

struct OnboardingStart_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingStart()
    }
}
