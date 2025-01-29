//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Yunus Emre AKYOL on 29.01.2025.
//  Copyright © 2025 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain{
    
    var bmi: BMI?
    
    func GetBMIvalue() -> String{
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
    }
    
    func GetAdvice() -> String{
        return bmi?.advice ?? "No Adivce"
    }
    
    func GetColor() -> UIColor{
        return bmi?.color ?? UIColor.white
    }
    
    mutating func CalculateBMI(height: Float, weight:Float){
        let bmiValue = weight / (height * height)
        
        if bmiValue < 18.5{
            bmi = BMI(value: bmiValue, advice: "Eat More Pies", color: UIColor.blue)
        }else if bmiValue < 25{
            bmi = BMI(value: bmiValue, advice: "Fir a fiddle!", color: UIColor.green)
        }else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies", color: UIColor.red)
        }
    }
}
