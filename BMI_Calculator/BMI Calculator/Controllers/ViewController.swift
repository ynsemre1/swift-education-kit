//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var heightText: UILabel!
    @IBOutlet weak var weightText: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightText.text = String(format: "%.2f", sender.value) + "m"
    }
    
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightText.text = String(Int(sender.value)) + "Kg"
    }
    
    func calculateBMI() -> Double {
        let height = Double(heightSlider.value)
        let weight = Double(weightSlider.value)
        
        let bmi = weight / (height * height)
        
        return bmi
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        calculateBMI()
        
    }
}

