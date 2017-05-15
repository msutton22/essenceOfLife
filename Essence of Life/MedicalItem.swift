//
//  MedicalItem.swift
//  Essence of Life
//
//  Created by rkalvani on 5/15/17.
//  Copyright © 2017 Les Lentilz. All rights reserved.
//

import Foundation

struct MedicalItem {
    var title: String
    var deadline: Date
    var UUID: String
    
    init(deadline: Date, title: String, UUID: String) {
        self.deadline = deadline
        self.title = title
        self.UUID = UUID
    }
    
    var isOverdue: Bool {
        return (Date().compare(self.deadline) == ComparisonResult.orderedDescending) // deadline is earlier than current date
    }
}
