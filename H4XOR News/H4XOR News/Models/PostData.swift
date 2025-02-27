//
//  PostData.swift
//  H4XOR News
//
//  Created by Yunus Emre AKYOL on 27.02.2025.
//

import Foundation

struct Results:Decodable{
    let hits: [Post]
}

struct Post:Decodable, Identifiable{
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url:String?
}
