//
//  Wave.swift
//  Set
//
//  Created by Pro on 13/04/2022.
//

import SwiftUI


struct Wave: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addCurve(
            to: CGPoint(x: 60, y: 120),
            control1: CGPoint(x: 60, y: 250),
            control2: CGPoint(x: 0, y: 190)
        )
        
        
        return path
    }
}

struct Wave2: Shape {
    func path(in rect: CGRect) -> Path {

        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: rect.minX, y: rect.minY))
        
        bezierPath.addCurve(
            to: CGPoint(x: 0 - rect.minX, y: 119.68 - rect.minY),
            controlPoint1: CGPoint(x: 59.7 - rect.minX, y: 251.32 - rect.minY),
            controlPoint2: CGPoint(x: 0 - rect.minX, y: 191.48 - rect.minY))
        
        bezierPath.addCurve(
            to: CGPoint(x: 95.52 - rect.minX, y: 0 - rect.minY),
            controlPoint1: CGPoint(x: 0 - rect.minX, y: 47.87 - rect.minY),
            controlPoint2: CGPoint(x: 95.52 - rect.minX, y: 0 - rect.minY))
        
        bezierPath.addCurve(
            to: CGPoint(x: 202.97 - rect.minX, y: 35.9 - rect.minY),
            controlPoint1: CGPoint(x: 95.52 - rect.minX, y: 0 - rect.minY),
            controlPoint2: CGPoint(x: 202.97 - rect.minX, y: 0 - rect.minY))
        
        bezierPath.addCurve(
            to: CGPoint(x: 143.28 - rect.minX, y: 119.68 - rect.minY),
            controlPoint1: CGPoint(x: 202.97 - rect.minX, y: 71.81 - rect.minY),
            controlPoint2: CGPoint(x: 143.28 - rect.minX, y: 83.77 - rect.minY))
        
        bezierPath.addCurve(
            to: CGPoint(x: 202.97 - rect.minX, y: 251.32 - rect.minY),
            controlPoint1: CGPoint(x: 143.28 - rect.minX, y: 155.58 - rect.minY),
            controlPoint2: CGPoint(x: 202.97 - rect.minX, y: 251.32 - rect.minY))
        
        bezierPath.addCurve(
            to: CGPoint(x: 143.28 - rect.minX, y: 382.96 - rect.minY),
            controlPoint1: CGPoint(x: 202.97 - rect.minX, y: 251.32 - rect.minY),
            controlPoint2: CGPoint(x: 226.85 - rect.minX, y: 347.06 - rect.minY))
        
        bezierPath.addCurve(
            to: CGPoint(x: 59.7 - rect.minX, y: 418.87 - rect.minY),
            controlPoint1: CGPoint(x: 59.7 - rect.minX, y: 418.87 - rect.minY),
            controlPoint2: CGPoint(x: 59.7 - rect.minX, y: 418.87 - rect.minY))
        
        bezierPath.addCurve(
            to: CGPoint(x: 0 - rect.minX, y: 347.06 - rect.minY),
            controlPoint1: CGPoint(x: 59.7 - rect.minX, y: 418.87 - rect.minY),
            controlPoint2: CGPoint(x: 0 - rect.minX, y: 394.93 - rect.minY))
        
        bezierPath.addCurve(
            to: CGPoint(x: 59.7 - rect.minX, y: 287.22 - rect.minY),
            controlPoint1: CGPoint(x: 0 - rect.minX, y: 299.19 - rect.minY),
            controlPoint2: CGPoint(x: 59.7 - rect.minX, y: 287.22 - rect.minY))
        
        bezierPath.addLine(to: CGPoint(x: 59.7 - rect.minX, y: 251.32 - rect.minY))
        
        bezierPath.close()
        
        bezierPath.lineWidth = 1
        bezierPath.stroke()
        
        return Path(bezierPath.cgPath)
    }
}




