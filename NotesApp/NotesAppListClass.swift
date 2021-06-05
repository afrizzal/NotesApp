//
//  NotesAppListClass.swift
//  NotesApp
//
//  Created by Afrizzal on 05/06/21.
//

import UIKit

class NotesAppListClass: NSObject {
    var listName: String!
    var listItems : Array <ItemClass>!
    var listOwner : UserClass!

    
    init(inpListName: String, inpOwner: UserClass, inpListItems: Array<ItemClass>) {
        
        listName = inpListName
        listItems = inpListItems
        listOwner = inpOwner
    }
}
