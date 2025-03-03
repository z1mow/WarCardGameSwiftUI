//
//  ContentView.swift
//  WarCardGame
//
//  Created by Şakir Yılmaz ÖĞÜT on 3.03.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard = "back"
    @State var cpuCard = "back"
    
    @State var playerScore = 0
    @State var cpuScore = 0
    
    var body: some View {
        
        ZStack {
            
            Image("background-plain")
                .resizable()
                .ignoresSafeArea()
                
            
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack {
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                
                Button  {
                    deal()
                } label: {
                    Image("button")
                }

                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .foregroundColor(.white)
                
                Spacer()
                
                Button {
                    reset()
                } label: {
                    Text("Reset Game")
                        .font(.headline)
                        .foregroundColor(.white)
                }

            }
        }
    }
    
    func deal() {
        let playerCardValue = Int.random(in: 2...14)
        playerCard = "card\(playerCardValue)"
        
        let cpuCardValue = Int.random(in: 2...14)
        cpuCard = "card\(cpuCardValue)"
        
        if playerCardValue > cpuCardValue {
            playerScore += 1
        } else if playerCardValue < cpuCardValue {
            cpuScore += 1
        }
    }
    
    func reset() {
        playerScore = 0
        cpuScore = 0
        playerCard = "back"
        cpuCard = "back"
    }
    
}

#Preview {
    ContentView()
}
