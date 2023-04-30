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
        
        pet?.save { [weak self] result in

            // Switch to the main thread for any UI updates
            switch result {
                case .success(let pet):
                    print("✅ Pet Saved! \(pet)")
                    self?.pet = pet // Return saved ParseObject with objectId
                
                case .failure:
                    DispatchQueue.main.async {
                    }
            }
            
        }
        
        // pet?.owner = user.objectId
        user.pets = [pet?.objectId]
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
            nextViewController.pet = pet
        }
    }
}
