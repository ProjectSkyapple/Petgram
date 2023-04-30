//
//  Onboarding6ViewController.swift
//  Petgram
//
//  Created by Aaron Jacob on 4/30/23.
//

import UIKit

class Onboarding6ViewController: UIViewController {
    var user: User?
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBAction func didTapStartExploringButton(_ sender: Any) {
        guard let password = PasswordTextField.text, !password.isEmpty else {
            // TODO: Show password required alert
            return
        }
        
        user?.password = password
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
