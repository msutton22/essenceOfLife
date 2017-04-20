//
//  FunViewController.swift
//  Essence of Life
//
//  Created by Maddy Sutton on 4/17/17.
//  Copyright © 2017 Les Lentilz. All rights reserved.
//

import UIKit

class FunViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var stars: StarControl!
    @IBOutlet weak var imageReview: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var reviewTextField: UITextField!
    @IBOutlet weak var reviewText: UITextView!
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

    

    
}
