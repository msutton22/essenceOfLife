//
//  FunViewController.swift
//  Essence of Life
//
//  Created by Maddy Sutton on 4/17/17.
//  Copyright © 2017 Les Lentilz. All rights reserved.
//

import UIKit
import AVFoundation
import os.log

class FunViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var stars: StarControl!
    @IBOutlet weak var imageReview: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var reviewTextField: UITextField!
    var review : Review?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reviewTextField.delegate = self
        if let review = review {
            navigationItem.title = review.name
            reviewTextField.text = review.name
            imageReview.image = review.photo
            stars.rating = review.rating
        }
        updateSaveButtonState()
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("\(info)")
        }
        
        imageReview.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    

    @IBAction func onTappedImage(_ sender: UITapGestureRecognizer) {
        reviewTextField.resignFirstResponder()
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let button = sender as? UIBarButtonItem, button == saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let name = reviewTextField.text ?? ""
        let photo = imageReview.image
        let rating = stars.rating
        
        review = Review(name: name, photo: photo, rating: rating)
    }
    
    private func updateSaveButtonState() {
        let text = reviewTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }

    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        let isPresentingInAddReviewMode = presentingViewController is UINavigationController
        if isPresentingInAddReviewMode {
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("Not in a nav controller")
        }

    }
    
}
