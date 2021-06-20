//
//  ReadWriteOnDisk.swift
//  NotesApp
//
//  Created by Afrizzal on 20/06/21.
//

import UIKit

class ReadWriteOnDisk: NSObject {
    
    static let docsURL = try! FileManager.default.url(for: .documentDirectory,
                                                      in: .userDomainMask,
                                                      appropriateFor: nil,
                                                      create: true)
    
    static let dataPath = docsURL.appendingPathComponent("data.plist").path
    static let userPath = docsURL.appendingPathComponent("user.plist").path

    
    class func writeData ()   {
        
        AppData.sharedInstance.offlineLST = Array<GroceryListClass> ()
        for anyList in AppData.sharedInstance.currentLST  {
            if ( anyList.listOwner.uid == AppData.sharedInstance.curUser?.uid)   {
                AppData.sharedInstance.offlineLST.append(anyList)
            }
        }
        NSKeyedArchiver.archiveRootObject(AppData.sharedInstance.offlineLST,
                                          toFile: dataPath)
    }
    
    class func readData ()  {
        if let readData = NSKeyedUnarchiver.unarchiveObject(withFile: dataPath) as? Array <NotesAppListClass> {
            AppData.sharedInstance.offlineLST = readData
        }
    }
    
    class func writeUser ()   {
        NSKeyedArchiver.archiveRootObject(AppData.sharedInstance.curUser!,
                                          toFile: userPath)
    }
    
    class func readUser ()   {
        if let readUser = NSKeyedUnarchiver.unarchiveObject(withFile: userPath) as? UserClass {
            AppData.sharedInstance.curUser = readUser
        }
    }

}
