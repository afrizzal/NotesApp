//
//  ItemsViewController.swift
//  NotesApp
//
//  Created by Afrizzal on 25/06/21.
//

import UIKit

class ItemsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var listNameLabel: UILabel!
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var itemsTableView: UITableView!
    
    
    public var curListInt: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        listNameLabel.text = AppData.sharedInstance.currentLST[curListInt].listName
    }
    
    // TABLE VIEW
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.sharedInstance.currentLST[curListInt].listItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemsCell", for: indexPath)
        
        let thisItem : ItemClass = AppData.sharedInstance.currentLST[curListInt].listItems[indexPath.row]
        
        cell.textLabel?.text = thisItem.itemName
        
        if ( thisItem.itemPurchased) {
            cell.backgroundColor = UIColor.darkGray
            cell.textLabel?.textColor = UIColor.lightGray
            cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
            cell.accessoryType = UITableViewCellAccessoryType.checkmark
            // cross it off attributedString
            let attrStr = NSMutableAttributedString (string: thisItem.itemName)
            attrStr.addAttribute(NSAttributedStringKey.strikethroughStyle,
                                 value: 2,
                                 range: NSMakeRange(0, attrStr.length))
            cell.textLabel?.attributedText = attrStr
        }
        else { // not purchased
            cell.backgroundColor = UIColor.white
            cell.textLabel?.textColor = UIColor.black
            cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
            cell.accessoryType = UITableViewCellAccessoryType.none
            let attrStr = NSMutableAttributedString (string: thisItem.itemName)
            attrStr.addAttribute(NSAttributedStringKey.strikethroughStyle,
                                 value: 0,
                                 range: NSMakeRange(0, attrStr.length))
            cell.textLabel?.attributedText = attrStr
        }
        
        return cell
    }
    
    @IBAction func goBackAction(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func shareThisAction(_ sender: Any) {
        
    }
}

