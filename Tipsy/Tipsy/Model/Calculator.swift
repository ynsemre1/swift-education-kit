//
//  Calculator.swift
//  Tipsy
//
//  Created by Yunus Emre AKYOL on 29.01.2025.
//  Copyright © 2025 The App Brewery. All rights reserved.
//
struct Calculator {
    private var result: Double = 0.0

    mutating func calculateTipAmount(billTotal: Double, tipPercentage: Double, splitCount: Int) {
        // Hesaplama: (billTotal * tipPercentage) / splitCount
        result = (billTotal * tipPercentage) / Double(splitCount)
    }

    func getCalculateTipAmount() -> Double? {
        return result
    }
}
