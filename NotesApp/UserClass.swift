//
//  UserClass.swift
//  NotesApp
//
//  Created by Afrizzal on 05/06/21.
//

import UIKit

class UserClass: NSObject, NSCoding {
    
    var name: String!
    var email: String!
    var uid: String!
    
    init(inpName: String, inpEmail: String, inpUid: String) {
        
        name = inpName
        email = inpEmail
        uid = inpUid
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.email, forKey: "email")
        aCoder.encode(self.uid, forKey: "uid")
    }
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: "name") as! String
        let email = aDecoder.decodeObject(forKey: "email") as! String
        let uid = aDecoder.decodeObject(forKey: "uid") as! String
        
        self.init(inpName: name, inpEmail: email, inpUid: uid)
    }
}
