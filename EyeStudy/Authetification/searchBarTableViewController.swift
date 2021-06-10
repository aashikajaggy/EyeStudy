//
//  searchBarTableViewController.swift
//  
//
//  Created by Aashika Jagadeesh on 6/3/20.
//

import UIKit
import FirebaseDatabase
class searchBarTableViewController: UITableViewController, UISearchResultsUpdating, UISearchControllerDelegate {


    @IBOutlet var searchUsersTableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    
    @IBOutlet weak var rotorLabel: UILabel!
    var titlesArray = [NSDictionary?]()
    var filteredUsers = [NSDictionary?]()
    var keyArray:[String] = []
    var databaseRef = Database.database().reference()
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
        searchController.delegate = self
        databaseRef.child("posts").queryOrdered(byChild: "title").observe(.childAdded, with: { (snapshot) in
             let key = snapshot.key
             self.keyArray.append(key)
         
            let snapshot = snapshot.value as? NSDictionary
            
            //insert the rows
            if snapshot != nil {
                self.titlesArray.append(snapshot)
                self.searchUsersTableView.insertRows(at: [IndexPath(row: self.titlesArray.count-1, section:0)], with: UITableView.RowAnimation.automatic)
            }
           
          
            
        }, withCancel: { (error) in
            print("yo" + error.localizedDescription)
        })
       
        //updateSearchResults(for: searchController)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
     
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searchController.isActive && searchController.searchBar.text != ""{
           return filteredUsers.count
        }
        
        return titlesArray.count
    }
    var currentKey = ""
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("KEYSS:\(keyArray)")
        print("INDEX:\(indexPath.row)")
        currentKey = keyArray[indexPath.row]
        performSegue(withIdentifier: "toItem", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toItem" {
            let dvc = segue.destination as! searchedItemViewController
            dvc.itemKey = currentKey
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let title : NSDictionary?
               
             if searchController.isActive && searchController.searchBar.text != ""{
             
                title = self.filteredUsers[indexPath.row]
              }
              else
              {
                    title = self.titlesArray[indexPath.row]
                    print("TITLE:\(title as Any)")
                    
              
                
              }
              
             
        cell.textLabel?.text = title?["title"] as? String
        cell.detailTextLabel?.text = title?["description"] as? String

        return cell
    }

    func searchResults (searchText: String) {
      
        self.filteredUsers = self.titlesArray.filter{ title in
                let title = title!["title"] as? String
                return(title?.lowercased().contains(searchText.lowercased()))!
         
            
            
        
    }
        tableView.reloadData()
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
 
    @IBAction func cancelBtn(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    func updateSearchResults(for searchController: UISearchController) {
        searchResults(searchText: self.searchController.searchBar.text!)
    }
  
    }



   


