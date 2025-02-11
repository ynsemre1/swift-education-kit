//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseCore

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "⚡Flash Chat"
        navigationItem.hidesBackButton = true

    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            if let navController = navigationController {
                navController.popViewController(animated: true)
            } else {
                print("⚠️ Navigation Controller is nil. Dismissing instead.")
                dismiss(animated: true, completion: nil)
            }
        } catch let signOutError {
            print("❌ Error signing out: \(signOutError.localizedDescription)")
        }
    }
}
