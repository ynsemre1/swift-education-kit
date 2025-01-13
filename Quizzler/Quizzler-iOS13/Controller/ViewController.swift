//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    var countdownTimer: Timer? // Timer instance
    var remainingSeconds: Int = 1 // Countdown duration in seconds
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        progressBar.progress = 0
        updateQuestion()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle! //True, False
        let userGotItRight = quizBrain.cheackAnswer(userAnswer)
        
        if userGotItRight{
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        resetProgressBar()
        updateQuestion()
    }
    
    func updateQuestion(){
        questionLabel.text = quizBrain.getQuestionText()
        
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        startCountdown()
        progressBarIncrease()
    }
    
    func startCountdown() {
            countdownTimer?.invalidate() // Invalidate any existing timer
            
            countdownTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
                guard let self = self else { return }
                
                trueButton.backgroundColor = UIColor.clear
                falseButton.backgroundColor = UIColor.clear
                
                if self.remainingSeconds > 0 {
                    self.remainingSeconds -= 1
                } else {
                    timer.invalidate() // Stop the timer
                }
            }
        }
    
    func progressBarIncrease() {
        let quizLength = quizBrain.getProgress() // Convert quizLength to Float
        progressBar.progress = quizLength // Perform the division as Float
    }
    
    func resetProgressBar() {
        progressBar.progress = 0.0
    }
}

