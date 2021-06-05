//
//  AppData.swift
//  NotesApp
//
//  Created by Afrizzal on 05/06/21.
//

import UIKit

class AppData: NSObject {
    
    // singleton pattern
    static let sharedInstance = AppData()
    
    
    var curUser : UserClass?
    var currentLST: Array <NotesAppListClass>!
    
    
    public override init ()
    {
        currentLST = Array<NotesAppListClass> ()
    }

}
