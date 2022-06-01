//
//  TableViewCell.swift
//  TVC
//
//  Created by Luis Fernando Cuevas Cuauhtle on 20/5/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    // MARK: OUTLETS
    
    @IBOutlet weak var labelinCell: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
