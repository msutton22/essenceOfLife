//
//  PasswordClass.swift
//  Essence of Life
//
//  Created by HChlebek on 4/10/17.
//  Copyright © 2017 Les Lentilz. All rights reserved.
//

import UIKit

class Password: NSObject
{
    var website = ""
    var username = ""
    var password = ""
    
    init (Website: String, Username: String, Password: String)
    {
        super.init()
        website = Website
        username = Username
        password = Password
    }

}
