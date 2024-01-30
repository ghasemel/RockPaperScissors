//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Raouf on 26/01/2024.
//

import SwiftUI

struct MovesButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 50))
    }
}

extension Button {
    func movesButtonStyle() -> some View {
        modifier(MovesButton())
    }
}

func getNextMove() -> Int {
    Int.random(in: 0...2)
}

struct ContentView: View {
    let moves = ["Rock", "Paper", "Scissors"]
    let winningMoves = ["Paper", "Scissors", "Rock"]
    let losingMoves = ["Scissors", "Rock", "Paper"]
    
    let ROCK_INDEX = 0
    let PAPER_INDEX = 1
    let SCISSORS_INDEX = 2
    
    @State private var currentMove = getNextMove()
    @State private var shouldWin = Bool.random()
    
    
    @State private var score = 0
    @State private var wasCorrect = false
    
    @State private var showPrompt = false
    @State private var roundCounter = 1
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.6, green: 0.1, blue: 0.4), location: 0.3),
                .init(color: Color(red: 0.2, green: 0.5, blue: 0.7), location: 0.3)
            ], center: .top, startRadius: 300, endRadius: 500)
            .ignoresSafeArea()
            
            Spacer()
            Spacer()
            
            VStack {
                Spacer()
                VStack(spacing: 100) {
                    
                    VStack(spacing: 10) {
                        
                        Text("Move: \(moves[currentMove])")
                        Text("Win or Lose: \(shouldWin ? "Win" : "Lose")")
                    }
                    .font(.headline)
                    
                    HStack {
                        Spacer()
                        
                        Button("🪨") {
                            select(moveIndex: ROCK_INDEX)
                        }
                        .movesButtonStyle()
                        
                        Spacer()
                        
                        Button("📄") {
                            select(moveIndex: PAPER_INDEX)
                        }
                        .movesButtonStyle()
                        
                        Spacer()
                        
                        Button("✂️") {
                            select(moveIndex: SCISSORS_INDEX)
                        }
                        .movesButtonStyle()
                        
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                .padding()
                .alert("The End", isPresented: $showPrompt) {
                    Button("Play Again") {
                        resetTheGame()
                    }
                } message: {
                    Text("Your final score is: \(score)")
                }
                
                Spacer()
                
                Text("Your score: \(score)")
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .clipShape(.capsule)
                    .background(wasCorrect ? .green : .red)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                Spacer()
            }
            
        }
    }
    
    func resetTheGame() {
        roundCounter = 1
        score = 0
        wasCorrect = false
        showPrompt = false
        currentMove = getNextMove()
        shouldWin.toggle()
    }
    
    func select(moveIndex: Int) {
        if shouldWin {
            wasCorrect = winningMoves[currentMove] == moves[moveIndex]
            score += wasCorrect ? 1 : -1
        } else {
            wasCorrect = losingMoves[currentMove] == moves[moveIndex]
            score += wasCorrect ? 1 : -1
        }
        
        currentMove = getNextMove()
        shouldWin.toggle()
        
        roundCounter += 1
        if roundCounter == 10 {
            showPrompt = true
        }
    }
}

#Preview {
    ContentView()
}
