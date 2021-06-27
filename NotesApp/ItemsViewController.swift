import UIKit

class ItemsViewController: UIViewController,
            UITableViewDelegate,
            UITableViewDataSource,
            UITextFieldDelegate {

    @IBOutlet weak var listNameLabel: UILabel!
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var itemsTableView: UITableView!
    
    
    public var curListInt: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        listNameLabel.text = AppData.sharedInstance.currentLST[curListInt].listName
        
        
        itemTextField.returnKeyType = UIReturnKeyType.done
        itemTextField.delegate = self
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let newItem = ItemClass (inpItemName: textField.text!,
                                 inpItemTime: Date(),
                                 inpItemPurchased: false)
        
        textField.text = ""
        
        AppData.sharedInstance.currentLST[curListInt].listItems.append(newItem)
        itemsTableView.reloadData()
        
        ReadWriteOnDisk.writeData()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
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
            cell.accessoryType = UITableViewCell.AccessoryType.checkmark
            // cross it off attributedString
            let attrStr = NSMutableAttributedString (string: thisItem.itemName)
            attrStr.addAttribute(NSAttributedString.Key.strikethroughStyle,
                                 value: 2,
                                 range: NSMakeRange(0, attrStr.length))
            cell.textLabel?.attributedText = attrStr
        }
        else { // not purchased
            cell.backgroundColor = UIColor.white
            cell.textLabel?.textColor = UIColor.black
            cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
            cell.accessoryType = UITableViewCell.AccessoryType.none
            let attrStr = NSMutableAttributedString (string: thisItem.itemName)
            attrStr.addAttribute(NSAttributedString.Key.strikethroughStyle,
                                 value: 0,
                                 range: NSMakeRange(0, attrStr.length))
            cell.textLabel?.attributedText = attrStr
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        AppData.sharedInstance.currentLST[curListInt].listItems[indexPath.row].itemPurchased =
        !AppData.sharedInstance.currentLST[curListInt].listItems[indexPath.row].itemPurchased
        
        itemsTableView.reloadData()
        
        ReadWriteOnDisk.writeData()
        
        // add the time of the latest edit
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String?
    {
        return "Delete?"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        AppData.sharedInstance.currentLST[curListInt].listItems.remove(at: indexPath.row)
        
        ReadWriteOnDisk.writeData()
        
        tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
    }
    
    
    
    
    
    
    
    
    


    @IBAction func goBackAction(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func shareThisAction(_ sender: Any) {
        
    }
}
