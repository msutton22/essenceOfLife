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
        
    }
   

}
