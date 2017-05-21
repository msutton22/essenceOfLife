//
//  MedicalSchedulingViewController.swift
//  Essence of Life
//
//  Created by rkalvani on 5/15/17.
//  Copyright © 2017 Les Lentilz. All rights reserved.
//

import UIKit

class MedicalSchedulingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        let medicalItem = MedicalItem(deadline: deadlinePicker.date, title: titleField.text!, UUID: UUID().uuidString)
        MedicalList.sharedInstance.addItem(medicalItem) // schedule a local notification to persist this item
        let _ = self.navigationController?.popToRootViewController(animated: true) // return to list view
    }
}
