//
//  Onboarding5ViewController.swift
//  Petgram
//
//  Created by Aaron Jacob on 4/30/23.
//

import UIKit
import PhotosUI
import ParseSwift

class Onboarding5ViewController: UIViewController, PHPickerViewControllerDelegate {
    var user: User?
    var pet: Pet?
    var profilePhoto: UIImage?
    
    @IBOutlet weak var ProfilePhotoView: UIImageView!
    
    @IBAction func didTapSelectPhotosButton(_ sender: Any) {
        var config = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared()) // So assetIds are not nil
        config.filter = .images
        config.preferredAssetRepresentationMode = .current
        config.selectionLimit = 1
                
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self
        present(picker, animated: true)
    }
    
    @IBAction func didTapContinueButton(_ sender: Any) {
        guard let photo = profilePhoto, let photoData = photo.jpegData(compressionQuality: 0.1) else {
            // TODO: Show missing profile photo alert
            return
        }
        
        let profilePhotoFile = ParseFile(name: "UserProfilePhoto.jpg", data: photoData)
        
        user?.profilePhoto = profilePhotoFile
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        
        guard let provider = results.first?.itemProvider,
        // Make sure the provider can load a UIImage
        provider.canLoadObject(ofClass: UIImage.self) else { return }

        let result = results.first
        
        if let assetId = result?.assetIdentifier {
            let assetResults = PHAsset.fetchAssets(withLocalIdentifiers: [assetId], options: nil)
        }
        
        // Load a UIImage from the provider
        provider.loadObject(ofClass: UIImage.self) { [weak self] object, error in
            
            // Make sure we can cast the returned object to a UIImage
            guard let image = object as? UIImage else {
                // TODO: Show image failure alert
                return
            }
            
            // Check for and handle any errors
            if let error = error {
                // TODO: Show image failure alert
                return
            } else {
                // UI updates (like setting image on image view) should be done on main thread
                DispatchQueue.main.async {
                    
                    // Set image on preview image view
                    self?.ProfilePhotoView.image = image
                    
                    // Set image to use when saving post
                    self?.profilePhoto = image
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ProfilePhotoView.layer.cornerRadius = 9
        ProfilePhotoView.backgroundColor = .lightGray
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let nextViewController = segue.destination as? Onboarding6ViewController {
            nextViewController.user = user
            nextViewController.pet = pet
        }
    }
}
