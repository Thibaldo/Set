//
//  DiamondView.swift
//  Set
//
//  Created by Pro on 13/04/2022.
//

import SwiftUI

struct Hatching: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        for x in Int(rect.minX)..<Int(rect.maxX) {
            if x.isMultiple(of: 8) {
                path.move(to: CGPoint(x: Double(x), y: rect.minY))
                path.addLine(to: CGPoint(x: Double(x), y: rect.maxY))
            }
        }
        
        return path
    }
}

struct ShapeView<Accessory: Shape>: View {
    
    let shape: Accessory
    let color: Color
    let filling: CardFilling
    
    var body: some View {
        switch filling {
        case .empty:
            shape
                .stroke(color, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
        case .hatching:
            Hatching()
                .stroke(color, style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                .clipShape(shape)
                .overlay(
                    shape
                        .stroke(color, style: StrokeStyle(lineWidth: 3))
                )
        default:
            shape
                .fill(color)
        }
    }
}

struct ShapeView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeView(shape: Circle(), color: .blue, filling: .hatching)
            .padding()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
