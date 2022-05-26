//
//  ContentView.swift
//  Set
//
//  Created by Pro on 08/04/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var startGame = false
    
    var body: some View {
        if !startGame {
            VStack(alignment: .center) {
                Spacer()
                HStack {
                    Spacer()
                    Button() {
                        startGame = true
                    }
                label: {
                    Spacer()
                    Text("PLAY")
                    Spacer()
                }
                .foregroundColor(.white)
                .padding()
                .background(.blue)
                .clipShape(Capsule())
                .frame(maxWidth: 100)
                    Spacer()
                }
                
                Spacer()
            }
        } else {
            GameView(startGame: $startGame)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
