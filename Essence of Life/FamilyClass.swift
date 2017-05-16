//
//  FamilyClass.swift
//  Essence of Life
//
//  Created by HChlebek on 5/16/17.
//  Copyright © 2017 Les Lentilz. All rights reserved.
//

import UIKit

class FamilyClass: NSObject
{
    var condition = ""
    var relationship = ""
    var side = ""
    
    init (Condition: String, Relationship: String, Side: String)
    {
        super.init()
        condition = Condition
        relationship = Relationship
        side = Side
    }
    
    
}
