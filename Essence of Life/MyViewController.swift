//
//  ViewController.swift
//  Essence of Life
//
//  Created by Maddy Sutton on 3/22/17.
//  Copyright © 2017 Les Lentilz. All rights reserved.
//

import UIKit
import AVFoundation
import os.log

class MyViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var commentBox: UITextView!
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var imageView: UIImageView!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func onTappedImage(_ sender: UITapGestureRecognizer) {
    }

    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
    }

    @IBAction func saveButton(_ sender: UIBarButtonItem) {
    }

}

