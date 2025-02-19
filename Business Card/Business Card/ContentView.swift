//
//  ContentView.swift
//  Business Card
//
//  Created by Yunus Emre AKYOL on 19.02.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 44 / 255, green: 57 / 255, blue: 48 / 255)
                .ignoresSafeArea()
            VStack {
                Image("yun")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200, alignment: .top)
                    .offset(y: -10)
                    .clipped()
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 5)
                    )

                Text("Yunus Emre")
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .bold()
                    .foregroundColor(.white)
                Text("iOS Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                
                Divider()
                InfoView(number: "+90 111 111 11 11", imageName: "phone.fill")
                InfoView(number: "yunusemreakyol@gmail.com", imageName: "envelope.fill")
            }
        }
    }
}

#Preview {
    ContentView()
}

