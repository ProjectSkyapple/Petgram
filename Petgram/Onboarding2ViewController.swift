//
//  Onboarding2ViewController.swift
//  Petgram
//
//  Created by Aaron Jacob on 4/24/23.
//

import UIKit

class Onboarding2ViewController: UIViewController {
    var pet: Pet?
    
    @IBOutlet weak var TalentsAndAbilitiesTextField: UITextField!
    @IBOutlet weak var LocationTextField: UITextField!
    
    @IBAction func didTapContinueButton(_ sender: Any) {
        guard let talentsAndAbilities = TalentsAndAbilitiesTextField.text, let location = LocationTextField.text, !talentsAndAbilities.isEmpty, !location.isEmpty
        else {
            // TODO: Show missing info alert
            return
        }
        
        pet?.talentsAndAbilities = talentsAndAbilities
        pet?.location = location
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextViewController = segue.destination as? Onboarding3ViewController {
            nextViewController.pet = pet
        }
    }
}
