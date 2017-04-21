//
//  ReviewTableViewController.swift
//  Essence of Life
//
//  Created by Maddy Sutton on 4/6/17.
//  Copyright © 2017 Les Lentilz. All rights reserved.
//

import UIKit
import os.log

class ReviewTableViewController: UITableViewController {
 var reviews = [Review]()
    
   
    @IBOutlet weak var addItem: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = editButtonItem
        if let savedReviews = loadReviews() {
            reviews += savedReviews
        }

    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ReviewTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ReviewTableViewCell  else {
            fatalError("Not of ReviewTableViewCell")
        }
        
        let review = reviews[indexPath.row]
        
        cell.labelReview.text = review.name
        cell.imageReview.image = review.photo
        cell.stars.rating = review.rating
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        switch(segue.identifier ?? "") {
        case "AddItem":
            os_log("Adding a new review", log: OSLog.default, type: .debug)
        case "ShowDetail":
            guard let reviewDetailViewController = segue.destination as? FunViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            guard let selectedReviewCell = sender as? ReviewTableViewCell else {
                fatalError("Unexpected sender: \(sender)")
            }
            guard let indexPath = tableView.indexPath(for: selectedReviewCell) else {
                fatalError("The cell not being displayed")
            }
            let selectedReview = reviews[indexPath.row]
            reviewDetailViewController.review = selectedReview
            
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
    }
    
    @IBAction func unwindToReviewList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? FunViewController, let review = sourceViewController.review {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                reviews[selectedIndexPath.row] = review
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            else {
                let newIndexPath = IndexPath(row: reviews.count, section: 0)
                
                reviews.append(review)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            saveReviews()
        }
        
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            reviews.remove(at: indexPath.row)
            saveReviews()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    private func saveReviews() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(reviews, toFile: Review.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Reviews saved", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed", log: OSLog.default, type: .error)
        }
    }

    
    
    private func loadReviews() -> [Review]?  {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Review.ArchiveURL.path) as? [Review]
    }
    


}
