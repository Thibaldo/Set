//
//  BackgroundView.swift
//  Set
//
//  Created by Pro on 15/04/2022.
//

import SwiftUI

enum AnswerType {
    case goodAnswer, wrongAnswer, noAnswer
}

struct BackgroundView: View {
    
    let answer: AnswerType
    
    private var backgroundColor: Color {
        switch answer {
        case .goodAnswer:
            return .green
        case .wrongAnswer:
            return .red
        case .noAnswer:
            return .white
        }
    }
    
    var body: some View {
        Rectangle()
            .ignoresSafeArea()
            .foregroundColor(backgroundColor)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        
        BackgroundView(answer: .noAnswer)
    }
}
