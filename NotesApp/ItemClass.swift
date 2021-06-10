//
//  ItemClass.swift
//  NotesApp
//
//  Created by Afrizzal on 05/06/21.
//

import UIKit

class ItemClass: NSObject, NSCoding {
    
    var itemName: String!
    var itemTime: Date!
    var itemPurchased: Bool!

    init(inpItemName: String, inpItemTime: Date, inpItemPurchased: Bool) {
        
        itemName = inpItemName
        itemTime = inpItemTime
        itemPurchased = inpItemPurchased
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.itemName, forKey: "itemName")
        aCoder.encode(Convert.timeToString(inp: self.itemTime), forKey: "itemTime")
        aCoder.encode(Convert.boolToString(inp: self.itemPurchased), forKey: "itemPurchased")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let thisName = aDecoder.decodeObject(forKey: "itemName") as! String
        let thisTime = aDecoder.decodeObject(forKey: "itemTime") as! String
        let thisPurchased = aDecoder.decodeObject(forKey: "itemPurchased") as! String
        
        
        self.init(inpItemName: thisName,
                  inpItemTime: Convert.stringToTime(inp: thisTime),
                  inpItemPurchased: Convert.stringToBool(inp: thisPurchased ))
    }
}
