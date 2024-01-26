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

struct ContentView: View {
    let moves = ["Rock", "Paper", "Scissors"]
    
    @State private var currentMove = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    
    
    @State private var score = 0
    //@State private var showPrompt = false
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.3, green: 0.3, blue: 0.55), location: 0.3),
                .init(color: Color(red: 0.6, green: 0.7, blue: 0.0), location: 0.3)
            ], center: .top, startRadius: 300, endRadius: 500)
            .ignoresSafeArea()
            
            Spacer()
            Spacer()
            
            VStack(spacing: 100) {
                
                VStack(spacing: 10) {
                    Text("Your score: \(score)")
                    Text("Move: \(currentMove)")
                    Text("Win or Lose: \(shouldWin ? "Win" : "Lose")")
                }
                .font(.headline)
                
                HStack {
                    Spacer()
                    
                    Button("🪨") {
                        
                    }
                    .movesButtonStyle()
                    
                    Spacer()
                    
                    Button("📄") {
                        
                    }
                    .movesButtonStyle()
                    
                    Spacer()
                    
                    Button("✂️") {
                        
                    }
                    .movesButtonStyle()
                    
                    Spacer()
                }
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .padding()
            .background(.regularMaterial)
            .clipShape(.rect(cornerRadius: 20))
            .padding()
            
        }
    }
}

#Preview {
    ContentView()
}
