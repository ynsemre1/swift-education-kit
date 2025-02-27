//
//  ContentView.swift
//  H4XOR News
//
//  Created by Yunus Emre AKYOL on 27.02.2025.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var networkManager = NetworkManager()

    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationBarTitle("H4XOR News")
            .onAppear {
                networkManager.fetchData()
            }
        }
    }
}

#Preview {
    ContentView()
}
