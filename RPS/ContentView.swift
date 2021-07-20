//
//  ContentView.swift
//  RPS
//

import SwiftUI

struct ContentView: View {
    let choices = ["ROCK", "PAPER", "SCISSORS"]
    @State private var appChoice = Int.random(in: 0...2)
    @State private var playerToWin = Bool.random()
    @State private var score = 0
    
    var playerToWinString: String {
        if self.playerToWin == true {
            return "WIN"
        } else {
            return "LOSE"
        }
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text("Let's play ROCK PAPER SCISSORS !")
            Text("The App chose: \(choices[appChoice])")
            Text("Your goal is to: \(playerToWinString)")
            VStack(spacing: 15) {
                Text("Click your move")
                HStack {
                    ForEach(0 ..< 3) { number in
                        Button(action: {
                            self.flagTapped(number, playerToWinString, appChoice)
                        }) {
                            Text("\(choices[number])")
                                .padding(20)
                                .foregroundColor(.white)
                                .clipShape(Capsule())           .background(Color.blue)
                        }
                        
                    }
                }
            }
            Text("Score: \(score)")
        }
       
    }
    func flagTapped(_ number: Int, _ goal: String, _ appChoice: Int) {
        print(number, goal, appChoice)
        switch goal {
            case "WIN":
                if number == appChoice {
                    score += 0
                } else if number == 0 && appChoice == 1 {
                    score -= 1
                } else if number == 0 && appChoice == 2 {
                    score += 1
                } else if number == 1 && appChoice == 2 {
                    score -= score - 1
                } else if number == 1 && appChoice == 3 {
                    score += 1
                } else if number == 2 && appChoice == 0 {
                    score -= 1
                } else if number == 2 && appChoice == 1 {
                    score += 1
                }
            case "LOSE":
                if number == appChoice {
                    score -= 0
                } else if number == 0 && appChoice == 1 {
                    score += 1
                } else if number == 0 && appChoice == 2 {
                    score -= 1
                } else if number == 1 && appChoice == 2 {
                    score += score - 1
                } else if number == 1 && appChoice == 3 {
                    score -= 1
                } else if number == 2 && appChoice == 0 {
                    score += 1
                } else if number == 2 && appChoice == 1 {
                    score -= 1
                }
            default:
                score = score + 0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
