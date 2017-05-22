//
//  MedicalSchedulingViewController.swift
//  Essence of Life
//
//  Created by rkalvani on 5/15/17.
//  Copyright © 2017 Les Lentilz. All rights reserved.
//

import UIKit

class MedicalSchedulingViewController: UIViewController {
    @IBOutlet weak var titleField: UITextField!

    @IBOutlet weak var deadlinePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func savePress(_ sender: Any) {
        let medicalItem = MedicalItem(deadline: deadlinePicker.date, title: titleField.text!, UUID: UUID().uuidString)
        MedicalList.sharedInstance.addItem(medicalItem)
       // let _ = self.navigationController?.popToViewController(MedicalTableViewController, animated: true)    
    }
   
   
}
