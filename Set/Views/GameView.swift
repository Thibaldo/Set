//
//  GameView.swift
//  Set
//
//  Created by Pro on 08/04/2022.
//

import SwiftUI

enum CardShape: String, CaseIterable {
    case rectangle, diamond, wave
}

enum CardColor: String, CaseIterable {
    case green, red, blue
}

enum CardFilling: String, CaseIterable {
    case empty, full, hatching
}

struct Card: Identifiable {
    let id = UUID()
    let color: CardColor
    let shape: CardShape
    let filling: CardFilling
    let numberOfShape: Int
}

struct GameView: View {
    @State private var deck = [Card]()
    @State private var board = [Card]()
    @State private var selectedCards = [Card]()
    @State private var score = 0
    @State private var answer: AnswerType = .noAnswer
    @State private var gameIsOver = false
    @Binding var startGame: Bool
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack() {
                BackgroundView(answer: answer)
                
                VStack {
                    HStack {
                        Spacer()
                        TimerView(timerRunning: true, trigger: {
                            gameIsOver = true
                        })
                    }
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(board) { card in
                            CardView(card: card, isSelected: selectedCards.contains(where: {$0.id == card.id}))
                                .frame(width: geometry.size.width * 0.21, height: geometry.size.height * 0.25)
                                .onTapGesture {
                                    selectCard(card)
                                }
                        }
                    }
                    .padding(.horizontal, 40)
                }
                
            }
        }
        .onAppear() {
            initDeck()
            initBoard()
        }
        .alert("Time is over!", isPresented: $gameIsOver) {
            Button("OK", role: .cancel) {
                startGame = false
            }
        } message: {
            Text("Your score: \(score)")
        }
    }
    
    func initDeck() {
        for shape in CardShape.allCases {
            for color in CardColor.allCases {
                for filling in CardFilling.allCases {
                    for nb in 0..<3 {
                        deck.append(Card(color: color, shape: shape, filling: filling, numberOfShape: nb + 1))
                    }
                }
            }
        }
        deck.shuffle()
    }
    
    func initBoard() {
        for _ in 0..<12 {
            board.append(deck.removeFirst())
        }
    }
    
    func selectCard(_ card: Card) {
        if let i = selectedCards.firstIndex(where: { $0.id == card.id }) {
            selectedCards.remove(at: i)
        } else {
            if selectedCards.count < 3 {
                selectedCards.append(card)
                
                if selectedCards.count == 3 {
                    checkSet()
                }
                
            }
        }
    }
    
    func checkSet() {
        var shapesMatches: Set<CardShape> = []
        var colorsMatches: Set<CardColor> = []
        var fillingsMatches: Set<CardFilling> = []
        var numberMatches: Set<Int> = []
        
        selectedCards.forEach { card in
            shapesMatches.insert(card.shape)
            colorsMatches.insert(card.color)
            fillingsMatches.insert(card.filling)
            numberMatches.insert(card.numberOfShape)
        }
        
        if shapesMatches.count != 2 && colorsMatches.count != 2 && fillingsMatches.count != 2 && numberMatches.count != 2 {
            score += 20
            drawCards()
            withAnimation(.easeIn(duration: 0.5)) {
                answer = .goodAnswer
            }
            withAnimation(.easeIn(duration: 0.5).delay(0.7)) {
                answer = .noAnswer
            }
            
        } else {
            score -= 10
            withAnimation(.easeIn(duration: 0.5)) {
                answer = .wrongAnswer
            }
            withAnimation(.easeIn(duration: 0.5).delay(0.7)) {
                answer = .noAnswer
            }
        }
        
        selectedCards.removeAll()
    }
    
    
    func drawCards() {
        if deck.count < 3 {
            gameIsOver = true
        }
        
        selectedCards.forEach { selectedCard in
            guard let index = board.firstIndex(where: { $0.id == selectedCard.id }) else {
                print("Error")
                return
            }
            withAnimation(.easeIn(duration: 0.3)) {
                board[index] = deck.removeFirst()
            }
        }
    }
    
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(startGame: .constant(false))
            .previewInterfaceOrientation(.landscapeRight)
    }
}
