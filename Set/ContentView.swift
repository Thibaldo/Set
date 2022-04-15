//
//  ContentView.swift
//  Set
//
//  Created by Pro on 08/04/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GameView()
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
