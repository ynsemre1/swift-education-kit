//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var billTextFiled: UITextField!

    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!

    @IBOutlet weak var splitNumberLabel: UILabel!

    var billCalculate = 0.0
    var tipPercentage = 0.1
    var stepperValue = 2

    var calculator = Calculator()

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true

        if sender == zeroPctButton {
            tipPercentage = 0.0
        } else if sender == tenPctButton {
            tipPercentage = 0.1
        } else if sender == twentyPctButton {
            tipPercentage = 0.2
        }
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let value = Int(sender.value)
        splitNumberLabel.text = String(value)
        stepperValue = value
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func calculateButton(_ sender: UIButton) {
        // billTextFiled.text içindeki değeri Double'a çevirmeye çalışıyoruz
        if let bill = Double(billTextFiled.text ?? "0") {
            billCalculate = bill  // Çeviri başarılıysa billCalculate'a atıyoruz
        } else {
            print("Error!!")
            return  // Hatalı giriş durumunda metottan çıkıyoruz
        }

        calculator.calculateTipAmount(
            billTotal: billCalculate, tipPercentage: tipPercentage,
            splitCount: stepperValue)

        self.performSegue(withIdentifier: "goToResult", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.total = String(calculator.getCalculateTipAmount()!)
        }
    }
}
