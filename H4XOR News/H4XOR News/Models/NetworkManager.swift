//
//  NetworkManager.swift
//  H4XOR News
//
//  Created by Yunus Emre AKYOL on 27.02.2025.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error fetching data: \(error.localizedDescription)")
                    return
                }
                
                guard let safeData = data else {
                    print("No data received")
                    return
                }
                
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(Results.self, from: safeData)
                    DispatchQueue.main.async {
                        self.posts = response.hits
                    }
                } catch {
                    print("Decoding error: \(error)")
                }
            }
            task.resume()
        }
    }
}
