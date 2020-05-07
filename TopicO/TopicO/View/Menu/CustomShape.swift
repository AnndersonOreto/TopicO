//
//  CustomShape.swift
//  TopicO
//
//  Created by Arthur Bastos Fanck on 05/05/20.
//  Copyright © 2020 Annderson Packeiser Oreto. All rights reserved.
//

import SwiftUI

struct CustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            var height = min(rect.size.height, UIScreen.main.bounds.height)
            let width = rect.size.width
            let yScale: CGFloat = 0.28
            height *= yScale
            let yOffset: CGFloat = height*0.2
            
            path.move(to: CGPoint(x: 0, y: height))
            path.addLine(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: width, y: 0))
            path.addLine(to: CGPoint(x: width, y: height))
            path.addQuadCurve(to: CGPoint(x: 0, y: height), control: CGPoint(x: width/2, y: height+yOffset))
            path.closeSubpath()
        }
    }
}
