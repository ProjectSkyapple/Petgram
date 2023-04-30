//
//  SignInViewController.swift
//  Petgram
//
//  Created by Aaron Jacob on 4/30/23.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBAction func didTapContinueButton(_ sender: Any) {
        guard let name = NameTextField.text, let password = PasswordTextField.text, !name.isEmpty, !password.isEmpty else {
                return
        }
                
        // Log in
        User.login(username: name, password: password) { [weak self] result in
            switch result {
            case .success(let user):
                print("✅ Successfully logged in as user: \(user.username!)")
                
                // Post a notification that the user has successfully logged in.
                NotificationCenter.default.post(name: Notification.Name("signin"), object: nil)
                
            case .failure:
                DispatchQueue.main.async {}
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
