//
//  ListsViewController.swift
//  NotesApp
//
//  Created by Afrizzal on 05/06/21.
//

import UIKit

class ListsViewController: UIViewController {

    @IBOutlet weak var profileButton: UIButton!
    
    @IBOutlet weak var listsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        AppData.sharedInstance.curUser = UserClass(inpName: "Aff",
                                                   inpEmail: "defEmail",
                                                   inpUid: "defUid")
        PrepareFirstLists.prepare()
    }
    
    // required
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppData.sharedInstance.currentLST.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listsCell", for: indexPath)
        let thisList = AppData.sharedInstance.currentLST[indexPath.row] as NotesAppListClass
        
        cell.textLabel?.text = thisList.listName
        cell.detailTextLabel?.text = String(thisList.listItems.count) + " for " + thisList.listOwner.name
        
        return cell
    }
    
    
    @IBAction func newListAction(_ sender: Any) {
    }
    
    @IBAction func profileAction(_ sender: Any) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
