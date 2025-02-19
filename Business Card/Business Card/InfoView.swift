//
//  InfoView.swift
//  Business Card
//
//  Created by Yunus Emre AKYOL on 19.02.2025.
//

import SwiftUI

struct InfoView: View {
    let number: String
    let imageName: String

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: imageName)
                .foregroundColor(.black)
                .font(.system(size: 20))

            Text(number)
                .foregroundColor(.black)
                .font(.system(size: 20))
        }
        .padding(.horizontal, 20)  // Kenarlardan boşluk ekliyoruz
        .padding(.vertical, 6)
        .frame(minWidth: 330, maxWidth: 330) // Yanlardan küçültme yapıldı
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}


#Preview(traits: .sizeThatFitsLayout) {
    InfoView(number: "Hello", imageName: "phone.fill")
}
