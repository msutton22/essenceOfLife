//
//  NewPasswordViewController.swift
//  Essence of Life
//
//  Created by rkalvani on 4/6/17.
//  Copyright © 2017 Les Lentilz. All rights reserved.
//

import UIKit

class NewPasswordViewController: UIViewController
{

    @IBOutlet weak var websiteTextfield: UITextField!
    @IBOutlet weak var usernameTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    
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
        websiteTextfield.text = Websit
        
    }
    
    

}
