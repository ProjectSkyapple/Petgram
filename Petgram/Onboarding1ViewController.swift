//
//  Onboarding1ViewController.swift
//  Petgram
//
//  Created by Aaron Jacob on 4/18/23.
//

import UIKit
import ParseSwift

class Onboarding1ViewController: UIViewController {
    var pet: Pet?
    
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var TypeTextField: UITextField!
    @IBOutlet weak var SpeciesTextField: UITextField!
    @IBOutlet weak var birthDatePicker: UIDatePicker!
    
    @IBAction func didTapContinueButton(_ sender: Any) {
        guard let name = NameTextField.text, let type = TypeTextField.text, let species = SpeciesTextField.text, !name.isEmpty, !type.isEmpty, !species.isEmpty
        else {
            // TODO: Show missing info alert
            return
        }
        
        var pet = Pet()
        pet.name = name
        pet.type = type
        pet.species = species
        pet.dateOfBirth = birthDatePicker.date
        self.pet = pet
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextViewController = segue.destination as? Onboarding2ViewController {
            nextViewController.pet = pet
        }
    }
}
