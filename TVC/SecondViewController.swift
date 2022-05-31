//
//  SecondViewController.swift
//  TVC
//
//  Created by Luis Fernando Cuevas Cuauhtle on 20/5/22.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    
    var table: TableViewController!
    
    var string: String = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        name.text =  string
        
        table.showData(dato: "Hola")
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
