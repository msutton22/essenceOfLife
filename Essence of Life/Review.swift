//
//  Review.swift
//  Essence of Life
//
//  Created by Maddy Sutton on 4/6/17.
//  Copyright © 2017 Les Lentilz. All rights reserved.
//

import UIKit
import os.log

class Review : NSObject {
    var photo: UIImage?
    var rating: Int = 0
    var name: String
    var type: String
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("review")
    

    init?(name: String, photo: UIImage?, rating: Int, type: String){
    guard !name.isEmpty else {
        return nil
    }
    
    guard (rating >= 0) && (rating <= 5) else {
        return nil
    }
    
    self.name = name
    self.photo = photo
    self.rating = rating
    self.type = type
    
}

struct PropertyKey {
    static let name = "name"
    static let photo = "photo"
    static let rating = "rating"
    static let type = "type"
    }

func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: PropertyKey.name)
    aCoder.encode(photo, forKey: PropertyKey.photo)
    aCoder.encode(rating, forKey: PropertyKey.rating)
    aCoder.encode(type, forKey: PropertyKey.type)
   
}


required convenience init?(coder aDecoder: NSCoder) {
    guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
        os_log("unable", log: OSLog.default, type: .debug)
        return nil
    }
    guard let type = aDecoder.decodeObject(forKey: PropertyKey.type) as? String else {
        os_log("unable", log: OSLog.default, type: .debug)
        return nil
    }
    
    let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
    let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating)
    
    
    
    self.init(name: name, photo: photo, rating: rating, type: type)
    
}


}


