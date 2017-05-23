//
//  MainPasswordViewController.swift
//  Essence of Life
//
//  Created by rkalvani on 4/6/17.
//  Copyright © 2017 Les Lentilz. All rights reserved.
//

import UIKit

class MainPasswordViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var passwordTableView: UITableView!
    
    var passwords : [Password] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "passwordCell", for: indexPath) as! NewPasswordTableViewCell
        cell1.websiteLabel.text = "Website: \(passwords[indexPath.row].website)"
        cell1.usernameLabel.text = "Username: \(passwords[indexPath.row].username)"
        cell1.passwordLabel.text = "Password: \(passwords[indexPath.row].password)"
        
        return cell1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return passwords.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            passwords.remove(at: indexPath.row)
            
            passwordTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
    {
        let items = passwords[sourceIndexPath.row]
        passwords.remove(at: sourceIndexPath.row)
        passwords.insert(items, at: destinationIndexPath.row)
    }
    
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem)
    {
      passwordTableView.isEditing = !passwordTableView.isEditing
    }
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem)
    {
        let myAlert = UIAlertController(title: "Add New Login?", message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        myAlert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .default) { (addAction) -> Void in
            let websiteTextField = myAlert.textFields! [0] as UITextField
            let usernameTextField = myAlert.textFields! [1] as UITextField
            let passwordTextField = myAlert.textFields! [2] as UITextField
            self.passwords.append(Password(Website: websiteTextField.text!, Username: usernameTextField.text!, Password: passwordTextField.text!))
            self.passwordTableView.reloadData()
    }
        myAlert.addAction(addAction)
        myAlert.addTextField { (websiteTextField) in
            websiteTextField.placeholder = "Add a website name"
        }
        myAlert.addTextField { (usernameTextField) in
            usernameTextField.placeholder = "Add your username"
        }
        myAlert.addTextField { (passwordTextField) in
            passwordTextField.placeholder = "Add your password"
        }
        self.present(myAlert, animated: true, completion: nil)
    }

}

