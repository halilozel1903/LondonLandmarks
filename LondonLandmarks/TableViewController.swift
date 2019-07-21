//
//  TableViewController.swift
//  LondonLandmarks
//
//  Created by Halil Özel on 21.07.2019.
//  Copyright © 2019 Halil Özel. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var items = [[String:String]]()
    
    func loadPlist() -> [[String:String]]{
        
        let path = Bundle.main.path(forResource: "Landmarks", ofType: ".plist")
        
        return NSArray.init(contentsOf: URL.init(fileURLWithPath: path!)) as! [[String:String]]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

      self.items = loadPlist()
        
        self.tableView.rowHeight = 100
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.items.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell

        // Configure the cell...
        
        let item = self.items[indexPath.row]
        
        cell.cellTitle.text = item["Name"]
        cell.cellDescription.text = item["Address"]
        cell.cellImage.image = UIImage(named: item["Image"]!)
        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "showDetail"){
            
            let dvc = segue.destination as! DetailViewController
            
            if let indexPath = self.tableView.indexPathForSelectedRow{
                
                let item = self.items[indexPath.row]
                
                dvc.sentData1 = item["Name"]
            }
        }
        
    }
 

}
