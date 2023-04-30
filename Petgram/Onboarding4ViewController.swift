//
//  Onboarding4ViewController.swift
//  Petgram
//
//  Created by Aaron Jacob on 4/29/23.
//

import UIKit

class Onboarding4ViewController: UIViewController {
    var pet: Pet?
    var user: User?
    
    @IBOutlet weak var FirstNameTextField: UITextField!
    @IBOutlet weak var LastNameTextField: UITextField!
    @IBOutlet weak var birthDatePicker: UIDatePicker!
    
    @IBAction func didTapContinueButton(_ sender: Any) {
        guard let firstName = FirstNameTextField.text, let lastName = LastNameTextField.text, !firstName.isEmpty, !lastName.isEmpty else {
            // TODO: Show missing info alert
            return
        }
        
        var user = User()
        user.username = firstName + " " + lastName
        user.dateOfBirth = birthDatePicker.date
        pet?.owner = user
        user.pets = [pet]
        self.user = user
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextViewController = segue.destination as? Onboarding5ViewController {
            nextViewController.user = user
        }
    }
}
