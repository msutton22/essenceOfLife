//
//  FamilyTableViewController.swift
//  Essence of Life
//
//  Created by HChlebek on 5/15/17.
//  Copyright © 2017 Les Lentilz. All rights reserved.
//

import UIKit

class FamilyTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
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
        cell.conditionLabel.text = "Condition: \(familyMembers[indexPath.row].condition)"
        cell.relationshipLabel.text = "Relationship: \(familyMembers[indexPath.row].relationship)"
        cell.sideLabel.text = "Side: \(familyMembers[indexPath.row].side)"
        
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
            familyMembers.remove(at: indexPath.row)
            
            familyTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
    {
        let items = familyMembers[sourceIndexPath.row]
        familyMembers.remove(at: sourceIndexPath.row)
        familyMembers.insert(items, at: destinationIndexPath.row)
    }
    
    

    @IBAction func addButtonTapped(_ sender: UIBarButtonItem)
    {
        let myAlert = UIAlertController(title: "Add New Information?", message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        myAlert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .default) { (addAction) -> Void in
            let conditionTextField = myAlert.textFields! [0] as UITextField
            let relationshipTextField = myAlert.textFields! [1] as UITextField
            let sideTextField = myAlert.textFields! [2] as UITextField
            self.familyMembers.append(FamilyClass(Condition: conditionTextField.text!, Relationship: relationshipTextField.text!, Side: sideTextField.text!))
            self.familyTableView.reloadData()
        }
        myAlert.addAction(addAction)
        myAlert.addTextField { (conditionTextField) in
            conditionTextField.placeholder = "Add a condition"
        }
        myAlert.addTextField { (relationshipTextField) in
            relationshipTextField.placeholder = "Add family relationship"
        }
        myAlert.addTextField { (sideTextField) in
            sideTextField.placeholder = "Add side of family"
        }
        self.present(myAlert, animated: true, completion: nil)
    }
    
    @IBAction func EditButtonTapped(_ sender: UIBarButtonItem)
    {
        familyTableView.isEditing = !familyTableView.isEditing
    }
    @IBAction func DoneButtonPressed(_ sender: UIBarButtonItem)
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
    
    

}
