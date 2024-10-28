//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(senderName: sender.currentTitle!)
        colorOpacity(senderName: sender)
    }
    
    // func funcName() { do stuff }
    
    func playSound(senderName: String) {
        let url = Bundle.main.url(forResource: senderName, withExtension: "wav")!
        player = try! AVAudioPlayer(contentsOf: url)
        player?.play()
    }
    
    func colorOpacity(senderName: UIButton){
        senderName.alpha = 0.5
        UIView.animate(withDuration: 0.4) {
            senderName.alpha = 1
        }
    }
}
