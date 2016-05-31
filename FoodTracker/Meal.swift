//
//  Meal.swift
//  FoodTracker
//
//  Created by Shashank Gupta on 05/03/16.
//  Copyright © 2016 Shashank Gupta. All rights reserved.
//

import UIKit

class Meal:NSObject,NSCoding {
    
    //MARK: Properties
    
    var name:String
    var photo:UIImage?
    var rating: Int
    
    //MARK: Archiving Paths
    static let DocumentsDirectory=NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL=DocumentsDirectory.URLByAppendingPathComponent("meals")
    
    
    //MARK: Types
    struct ProprtyKey {
        static let nameKey="name"
        static let photoKey="photo"
        static let ratingKey="rating"
    }
    
    //MARK: Initialization
    init?(name:String,photo:UIImage? ,rating:Int){
        self.name=name
        self.photo=photo
        self.rating=rating
        
        super.init()
        
        if name.isEmpty || rating<0 {
            return nil
        }
    }
    
    //MARK: NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: ProprtyKey.nameKey)
        aCoder.encodeObject(photo, forKey: ProprtyKey.photoKey)
        aCoder.encodeInteger(rating, forKey: ProprtyKey.ratingKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name=aDecoder.decodeObjectForKey(ProprtyKey.nameKey) as! String
        let photo=aDecoder.decodeObjectForKey(ProprtyKey.photoKey) as? UIImage
        let rating=aDecoder.decodeIntegerForKey(ProprtyKey.ratingKey)
        
        self.init(name:name,photo:photo,rating:rating)
    }
}
