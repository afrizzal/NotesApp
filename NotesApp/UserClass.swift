//
//  UserClass.swift
//  NotesApp
//
//  Created by Afrizzal on 05/06/21.
//

import UIKit

class UserClass: NSObject {
    
    var name: String!
    var email: String!
    var uid: String!
    
    init(inpName: String, inpEmail: String, inpUid: String) {
        
        name = inpName
        email = inpEmail
        uid = inpUid
    }

}
