//
//  TableViewController.swift
//  TVC
//
//  Created by Luis Fernando Cuevas Cuauhtle on 13/5/22.
//

import UIKit

class TableViewController: UITableViewController {

    
    // MARK: PROPERTIRES
    
    var names: [String] = ["miguel","jose","juan"]
    
    // Comentario
    var ejemplo: String = ""
    
    // Agregué un nuevo cambio con una nueva variable
    
    var ejemplo2: String = ""
    
    // MARK: OUTLETS
    @IBOutlet weak var nameinDetail: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
        return names.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        // Esta linea pasa el nombre de la celda al viewcontroller 2
        
        cell.labelinCell.text = names[indexPath.row]
        
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
    
    func showData(dato:String){
        print(dato)
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        let index = tableView.indexPathForSelectedRow
        
        let secondViewController = segue.destination as! SecondViewController
        
        secondViewController.string = names[index!.row]
        
        secondViewController.table = self
    }

}