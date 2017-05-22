//
//  MedicalTableViewController.swift
//  Essence of Life
//
//  Created by rkalvani on 5/15/17.
//  Copyright © 2017 Les Lentilz. All rights reserved.
//

import UIKit

class MedicalTableViewController: UITableViewController {

    var medicalItems: [MedicalItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(MedicalTableViewController.refreshList), name: NSNotification.Name(rawValue: "MedicalListShouldRefresh"), object: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshList()
    }
    func refreshList() {
        medicalItems = MedicalList.sharedInstance.allItems()
        if (medicalItems.count >= 64) {
            self.navigationItem.rightBarButtonItem!.isEnabled = false // disable 'add' button
        }
        tableView.reloadData()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medicalItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "medicalCell", for: indexPath) // retrieve the prototype cell (subtitle style)
        let medicalItem = medicalItems[(indexPath as NSIndexPath).row] as MedicalItem
        
        cell.textLabel?.text = medicalItem.title as String!
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "'Due' MMM dd 'at' h:mm a" // example: "Due Jan 01 at 12:00 PM"
        cell.detailTextLabel?.text = dateFormatter.string(from: medicalItem.deadline as Date)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true // all cells are editable
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete { // the only editing style we'll support
            // Delete the row from the data source
            let item = medicalItems.remove(at: (indexPath as NSIndexPath).row) // remove TodoItem from notifications array, assign removed item to 'item'
            tableView.deleteRows(at: [indexPath], with: .fade)
            MedicalList.sharedInstance.removeItem(item) // delete backing property list entry and unschedule local notification (if it still exists)
            self.navigationItem.rightBarButtonItem!.isEnabled = true // we definitely have under 64 notifications scheduled now, make sure 'add' button is enabled
        }
    }
}
