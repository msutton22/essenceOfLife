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

        passwords.append(Password(Website: "twitter", Username: "123456", Password: "78970"))
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell1 = tableView.dequeueReusableCell(withIdentifier: "passwordCell", for: indexPath) as! NewPasswordTableViewCell
        cell1.websiteLabel.text = passwords[indexPath.row].website
        cell1.usernameLabel.text = passwords[indexPath.row].username
        cell1.passwordLabel.text = passwords[indexPath.row].password
        
        return cell1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return passwords.count
    }
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem)
    {
        let myAlert = UIAlertController(title: "Add New Website?", message: nil, preferredStyle: .alert)
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
   
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let newPasswordVC = segue.destination as! NewPasswordViewController
        let selectedRow = passwordTableView.indexPathForSelectedRow?.row
        newPasswordVC.myPasswords = passwords[selectedRow!]
    }

}

