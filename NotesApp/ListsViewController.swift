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
    }
    
    // required
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "listsCell", for: indexPath)
        
        cell.textLabel?.text = "test"
        cell.detailTextLabel?.text = "sub test"
        
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
