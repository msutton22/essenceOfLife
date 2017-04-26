//
//  NewPasswordViewController.swift
//  Essence of Life
//
//  Created by rkalvani on 4/6/17.
//  Copyright © 2017 Les Lentilz. All rights reserved.
//

import UIKit
import os.log

class NewPasswordViewController: UIViewController
{

    @IBOutlet weak var websiteTextfield: UITextField!
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var myPasswords : Password?
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        
    }

    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem)
    {
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
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem)
    {
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let button = sender as? UIBarButtonItem, button == saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        myPasswords?.website = websiteTextfield.text!
        myPasswords?.username = usernameTextfield.text!
        myPasswords?.password = passwordTextfield.text!
    }
    private func updateSaveButtonState()
    {
        let text1 = websiteTextfield.text ?? ""
        saveButton.isEnabled = !text1.isEmpty
        let text2 = usernameTextfield.text ?? ""
        saveButton.isEnabled = !text2.isEmpty
        let text3 = passwordTextfield.text ?? ""
        saveButton.isEnabled = !text3.isEmpty
    }
}
