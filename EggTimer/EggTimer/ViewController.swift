//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var countdownTimer: Timer?
        
        let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
        
        @IBOutlet weak var titleLabel: UILabel!
    
        @IBAction func hardnessSelected(_ sender: UIButton) {
            let hardness = sender.currentTitle!
            
            // Retrieve the countdown seconds based on the selected hardness level
            if let countdownSeconds = eggTimes[hardness] {
                startCountdown(countdownSeconds)
            } else {
                print("Invalid selection.")
            }
        }
        
        func startCountdown(_ countdownSeconds: Int) {
            var remainingSeconds = countdownSeconds // Local variable to track remaining seconds
            
            countdownTimer?.invalidate() // Stop any existing timer

            countdownTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                if remainingSeconds > 0 {
                    print(remainingSeconds) // Print each second
                    remainingSeconds -= 1
                } else {
                    timer.invalidate() // Stop the countdown when it reaches zero
                    self.titleLabel.text = "Done!.."
                }
            }
        }
}
