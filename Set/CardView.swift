//
//  CardView.swift
//  Set
//
//  Created by Pro on 08/04/2022.
//

import SwiftUI


struct CardView: View {
    let card: Card
    let isSelected: Bool
    
    var body: some View {
        
        let shapeWidth = 0.22
        let shapeHeight = 0.89
        
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    ForEach(0..<card.numberOfShape, id: \.self) { _ in
                        switch card.shape {
                        case .diamond:
                            ShapeView(shape: Diamond(), color: getColor(card.color), filling: card.filling)
                                .frame(width: geometry.size.width * shapeWidth, height: geometry.size.height * shapeHeight)
                        case .rectangle:
                            ShapeView(shape: RoundedRectangle(cornerRadius: 15), color: getColor(card.color), filling: card.filling)
                                .frame(width: geometry.size.width * shapeWidth, height: geometry.size.height * shapeHeight)
                        default:
                            ShapeView(shape: Circle(), color: getColor(card.color), filling: card.filling)
                                .frame(width: geometry.size.width * shapeWidth, height: geometry.size.height * shapeHeight)
                        }
                    }
                    Spacer()
                }
                
                Spacer()
            }
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(isSelected ? .red : .black, lineWidth: 4)
            )
        }
    }
    
    func getColor(_ color: CardColor) -> Color {
        switch color {
        case .red:
            return Color.red
        case .blue:
            return Color.blue
        default:
            return Color.green
        }
    }
}




struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(color: .blue, shape: .wave, filling: .hatching, numberOfShape: 2), isSelected: false)
            .previewInterfaceOrientation(.landscapeRight)
    }
}
