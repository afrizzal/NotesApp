//
//  Convert.swift
//  NotesApp
//
//  Created by Afrizzal on 10/06/21.
//

import UIKit

class Convert: NSObject {
    class func stringToTime (inp: String ) -> Date    {
        let dateFormatter = DateFormatter ()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZ"
        let time : Date = dateFormatter.date(from: inp)!
        return time
    }
    
    class func timeToString (inp: Date) -> String    {
        return String(describing: inp)
    }
    
    class func boolToString (inp: Bool) -> String    {
        return String(inp)
    }
    
    class func stringToBool (inp: String) -> Bool    {
        var res = false
        if (inp == "True" || inp == "true")        {
            res = true
        }
        return res
    }

}
