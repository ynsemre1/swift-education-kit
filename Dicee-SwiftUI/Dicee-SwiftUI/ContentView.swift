//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by Yunus Emre AKYOL on 20.02.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var leftDiceNumber = 1
    @State private var rightDiceNumber = 1

    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Image("diceeLogo")
                
                Spacer()

                HStack {
                    DiceeImage(n: leftDiceNumber)
                    DiceeImage(n: rightDiceNumber)
                }
                .padding(.horizontal)

                Spacer()

                Button("Roll") {
                    rollDice()
                }
                .font(.system(size: 50, weight: .heavy))
                .padding()
                .frame(width: 200, height: 60)
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)

                Spacer()
            }
        }
    }

    private func rollDice() {
        leftDiceNumber = Int.random(in: 1...6)
        rightDiceNumber = Int.random(in: 1...6)
    }
}

struct DiceeImage: View {
    let n: Int

    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}

#Preview {
    ContentView()
}
