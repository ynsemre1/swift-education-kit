//
//  DetailView.swift
//  H4XOR News
//
//  Created by Yunus Emre AKYOL on 28.02.2025.
//

import SwiftUI
import WebKit


struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

#Preview {
    DetailView(url: "https://www.google.com")
}

