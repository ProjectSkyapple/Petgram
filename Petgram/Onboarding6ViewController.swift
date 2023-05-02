//
//  Onboarding6ViewController.swift
//  Petgram
//
//  Created by Aaron Jacob on 4/30/23.
//

import UIKit

class Onboarding6ViewController: UIViewController {
    var user: User?
    var pet: Pet?
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    @IBAction func didTapStartExploringButton(_ sender: Any) {
        guard let password = PasswordTextField.text, !password.isEmpty else {
            // TODO: Show password required alert
            return
        }
        
        user?.password = password
        
        user?.signup { [weak self] result in
            switch result {
            case .success(let user):
                
                print("✅ Successfully signed up user \(user.username!)")
                self?.pet?.owner = user.objectId
                
            case .failure:
                DispatchQueue.main.async {}
            }
            
        }
        
        pet?.save { [weak self] result in
            switch result {
            case .success:
                
                print("✅ Successfully saved pet owner to pet")
                
                // Post a notification that the user has successfully signed up.
                NotificationCenter.default.post(name: Notification.Name("login"), object: nil)
                
                User.login(username: (self?.user?.username)!, password: password) { [weak self] result in
                    switch result {
                    case .success(let user):
                        print("✅ Successfully logged in as user: \(user.username!)")
                        
                        // Post a notification that the user has successfully logged in.
                        NotificationCenter.default.post(name: Notification.Name("login"), object: nil)
                        
                    case .failure:
                        DispatchQueue.main.async {}
                    }
                }
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
