import UIKit
import Firebase

class ListsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var profileButton: UIButton!
    
    @IBOutlet weak var listsTableView: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        listsTableView.reloadData()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.readData()
        
    }
    
    

    func readData ()
    {
        ReadWriteOnDisk.readUser()
        if ( AppData.sharedInstance.curUser == nil)
        {
            // the very first time anyone uses this app
            AppData.sharedInstance.curUser = UserClass (inpName: "Me",
                                                        inpEmail: "defEmail",
                                                        inpUid: "defUid")
            PrepareFirstLists.prepare()
            
            ReadWriteOnDisk.writeData()
            ReadWriteOnDisk.writeUser()
        }
        else
        {
            ReadWriteOnDisk.readData()
            AppData.sharedInstance.currentLST = AppData.sharedInstance.offlineLST
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return AppData.sharedInstance.currentLST.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listsCell", for: indexPath)
        
        let thisList = AppData.sharedInstance.currentLST[indexPath.row] as GroceryListClass
        
        
        cell.textLabel?.text = thisList.listName
        cell.detailTextLabel?.text = String(thisList.listItems.count) + " for " + thisList.listOwner.name
        
        return cell
    }

    
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        AppData.sharedInstance.currentLST.remove(at: indexPath.row)
        ReadWriteOnDisk.writeData()
        
        
        tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Delete?"
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toItemsSegue_id", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        let itemsCtrl : ItemsViewController = segue.destination as! ItemsViewController
        itemsCtrl.curListInt = (sender as! IndexPath).row
    }
    
    
    
    
    
    @IBAction func newListAction(_ sender: Any) {
        let alert = UIAlertController (title: "New List",
                                        message: "Please enter the name of your new list",
                                        preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "new list"
            textField.font = UIFont.systemFont(ofSize: 22)
            textField.textAlignment = NSTextAlignment.center
        }
        
        alert.addAction(UIAlertAction(title: "Save",
                                      style: UIAlertActionStyle.default,
                                      handler:
            { (myAlert) in
                self.newListSave(inpName: alert.textFields![0].text!)
            }))
        
        alert.addAction(UIAlertAction(title: "Cancel",
                                      style: UIAlertActionStyle.cancel,
                                      handler:nil ))
        
        self.present(alert, animated: true, completion: nil)
    }
    

    func newListSave (inpName: String)
    {
        let newList = GroceryListClass(inpListName: inpName,
                                       inpOwner: AppData.sharedInstance.curUser!,
                                       inpListItems: [])
        
        AppData.sharedInstance.currentLST.append(newList)
        
        listsTableView.reloadData()
        
        ReadWriteOnDisk.writeData()
        
    }
    
    
    func alertShowMethod (titleStr: String, messageStr: String)
    {
        let alert = UIAlertController(title: titleStr,
                                      message: messageStr,
                                      preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK",
                                      style: UIAlertActionStyle.default,
                                      handler: nil))
        self.present(alert,
                     animated: true,
                     completion: nil)
    }
    
    
    
    
    
    
    @IBAction func profileAction(_ sender: Any) {
        
        let profAlert = UIAlertController (title: "Profile",
                                           message: "What would you like to do",
                                           preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let loginAction = UIAlertAction (title: "Login",
                                         style: UIAlertActionStyle.default)
        { (actionSheet) in
            // authenitciate user
            // read user's online lists
            // and compare them
        }
        profAlert.addAction(loginAction)
        
        let registerAction = UIAlertAction (title: "Register",
                                            style: UIAlertActionStyle.default)
        { (actionSheet) in
            self.registerAlert()
        }
        profAlert.addAction(registerAction)
        
        let logoutAction = UIAlertAction (title: "Logout",
                                          style: UIAlertActionStyle.default)
        { (actionSheet) in
            
        }
        profAlert.addAction(logoutAction)
        
        let cancelAction = UIAlertAction (title: "Cancel",
                                          style: UIAlertActionStyle.cancel,
                                          handler: nil)
        profAlert.addAction(cancelAction)
        
        self.present(profAlert, animated: true, completion: nil)
    }
    
    func registerAlert ()
    {
        let regAlert = UIAlertController(title: "Register",
                                         message: "Please enter name, email and apssword",
                                         preferredStyle: UIAlertControllerStyle.alert)
        
        regAlert.addTextField { (textFld) in
            textFld.placeholder = "name"
        }
        
        regAlert.addTextField { (textFld) in
            textFld.placeholder = "email"
        }
        
        regAlert.addTextField { (textFld) in
            textFld.placeholder = "password"
            textFld.isSecureTextEntry = true
        }
        
        regAlert.addAction(UIAlertAction(title: "Register",
                                         style: UIAlertActionStyle.default,
                                         handler:
            { (alert) in
                self.registerMethod(inpName: (regAlert.textFields?[0].text)!,
                                    inpEmail: (regAlert.textFields?[1].text)!,
                                    inpPassword: (regAlert.textFields?[2].text)!)
            }))
        
        regAlert.addAction(UIAlertAction(title: "Cancel",
                                         style: UIAlertActionStyle.cancel,
                                         handler: nil))
        
        self.present(regAlert, animated: true, completion: nil)
    }
    

    func registerMethod(inpName: String, inpEmail: String, inpPassword: String)
    {
        Auth.auth().createUser(withEmail: inpEmail,
                               password: inpPassword)
        { (user, error) in
            if ( error == nil)
            {
                let changeRequest = user?.createProfileChangeRequest()
                changeRequest?.displayName = inpName
                
                changeRequest?.commitChanges(completion:
                    { (profError) in
                        if ( profError == nil)
                        {
                            SetTheLocalUser.set(inpName: user!.displayName!,
                                                inpEmail: user!.email!,
                                                inpUid: user!.uid)
                            
                            let userDict : [String : String] = ["name": user!.displayName!,
                                                                "email": user!.email!,
                                                                "uid": user!.uid]
                            
                            AppData.sharedInstance.usersNode.child(user!.uid).setValue(userDict)
                            
                            for anyList in AppData.sharedInstance.currentLST
                            {
                                if ( anyList.listOwner.uid == AppData.sharedInstance.curUser!.uid)
                                {
                                    SaveListOnCloud.save(inpList: anyList)

                                }
                            }
                            
                            self.alertShowMethod(titleStr: "Success",
                                                 messageStr: "You are now registered on the server")
                            
                            self.listsTableView.reloadData()
                        }
                })
                
            }
        }
        
    }
    

    
}
