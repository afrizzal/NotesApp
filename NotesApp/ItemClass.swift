//
//  ItemClass.swift
//  NotesApp
//
//  Created by Afrizzal on 05/06/21.
//

import UIKit

class ItemClass: NSObject {
    
    var itemName: String!
    var itemTime: Date!
    var itemPurchased: Bool!

    init(inpItemName: String, inpItemTime: Date, inpItemPurchased: Bool) {
        
        itemName = inpItemName
        itemTime = inpItemTime
        itemPurchased = inpItemPurchased
    }
}
