//
//  FamilyTableViewController.swift
//  Essence of Life
//
//  Created by HChlebek on 5/15/17.
//  Copyright © 2017 Les Lentilz. All rights reserved.
//

import UIKit

class FamilyTableViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource
{

    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var familyTableView: UITableView!
    
    var familyMembers : [FamilyClass] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "famCell", for: indexPath) as! FamilyTableViewCell
        cell.conditionLabel.text = familyMembers[indexPath.row].condition
        cell.relationshipLabel.text = familyMembers[indexPath.row].relationship
        cell.sideLabel.text = familyMembers[indexPath.row].side
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return familyMembers.count
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

    

}
