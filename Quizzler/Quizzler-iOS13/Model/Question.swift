//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Yunus Emre AKYOL on 25.12.2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct Question{
    let question: String
    let answer: String
    
    init(q: String, a: String) {
        question = q
        answer = a
    }
}
