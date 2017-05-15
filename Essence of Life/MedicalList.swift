//
//  MedicalList.swift
//  Essence of Life
//
//  Created by rkalvani on 5/15/17.
//  Copyright © 2017 Les Lentilz. All rights reserved.
//

import Foundation
import UIKit

class MedicalList {
    class var sharedInstance : MedicalList {
        struct Static {
            static let instance: MedicalList = MedicalList()
        }
        return Static.instance
    }
    
    fileprivate let ITEMS_KEY = "medicalItems"
    
    func allItems() -> [MedicalItem] {
        let medicalDictionary = UserDefaults.standard.dictionary(forKey: ITEMS_KEY) ?? [:]
        let items = Array(medicalDictionary.values)
        return items.map({
            let item = $0 as! [String:AnyObject]
            return MedicalItem(deadline: item["deadline"] as! Date, title: item["title"] as! String, UUID: item["UUID"] as! String!)
        }).sorted(by: {(left: MedicalItem, right:MedicalItem) -> Bool in
            (left.deadline.compare(right.deadline) == .orderedAscending)
        })
}
    func addItem(_ item: MedicalItem) {
        // persist a representation of this todo item in NSUserDefaults
        var medicalDictionary = UserDefaults.standard.dictionary(forKey: ITEMS_KEY) ?? Dictionary() // if todoItems hasn't been set in user defaults, initialize todoDictionary to an empty dictionary using nil-coalescing operator (??)
        medicalDictionary[item.UUID] = ["deadline": item.deadline, "title": item.title, "UUID": item.UUID] // store NSData representation of todo item in dictionary with UUID as key
        UserDefaults.standard.set(medicalDictionary, forKey: ITEMS_KEY) // save/overwrite todo item list
}
    func removeItem(_ item: MedicalItem) {
        if var medicalItems = UserDefaults.standard.dictionary(forKey: ITEMS_KEY) {
            medicalItems.removeValue(forKey: item.UUID)
            UserDefaults.standard.set(medicalItems, forKey: ITEMS_KEY) // save/overwrite todo item list
        }
    }
}
