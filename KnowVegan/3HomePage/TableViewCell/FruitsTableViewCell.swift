//
//  FruitsTableViewCell.swift
//  KnowVegan
//
//  Created by Luis Fernando Cuevas Cuauhtle on 2/6/22.
//

// MARK: LIBRARIES

import UIKit

// MARK: MAIN CLASS

class FruitsTableViewCell: UITableViewCell {

    // MARK: CELL LIFE CYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
        // Initialization code
    }
    
    // MARK: PROPERTIES
    
    // MARK: OUTLETS
    
    // MARK: ACTIONS
    
    // MARK: FUNCTIONS
    
    // CELL'S INITIAL CONFIGURATION
    func setUpUI(){
        
    }
    
    // SET UP CELL DATA WITH
    
    func setUpCellWith(fruit: Fruits){
        
    }
    
    
    // MARK: OVERRIDES
    
    // CELL SELECTION'S ANIMATION
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
