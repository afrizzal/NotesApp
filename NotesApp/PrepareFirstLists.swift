//
//  PrepareFirstLists.swift
//  NotesApp
//
//  Created by Afrizzal on 05/06/21.
//

import UIKit

class PrepareFirstLists: NSObject {
    class func prepare()
    {
        let item_1 = ItemClass(inpItemName: "Bed",
                               inpItemTime: Date(),
                               inpItemPurchased: false)
        
        let item_2 = ItemClass(inpItemName: "Desk",
                               inpItemTime: Date(),
                               inpItemPurchased: true)
        
        let listA = NotesAppListClass (inpListName: "Sofa",
                                      inpOwner: AppData.sharedInstance.curUser!,
                                      inpListItems: [item_1, item_2])
        
        AppData.sharedInstance.currentLST.append( listA);
        
        
        let item_3 = ItemClass(inpItemName: "Table Lamp",
                               inpItemTime: Date(),
                               inpItemPurchased: false)
        
        let item_4 = ItemClass(inpItemName: "Office Chair",
                               inpItemTime: Date(),
                               inpItemPurchased: true)
        
        let listB = NotesAppListClass (inpListName: "Flowers",
                                      inpOwner: AppData.sharedInstance.curUser!,
                                      inpListItems: [item_3, item_4])
        
        AppData.sharedInstance.currentLST.append( listB);
    }
}
