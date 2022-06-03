//
//  FoodSearchTableViewCell.swift
//  KnowVegan
//
//  Created by Donovan Z. Jaimes on 02/06/22.
//

import UIKit

class FoodSearchTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    
    
    @IBOutlet weak var NameLabel: UILabel!
    
    
    @IBOutlet weak var DescripctionLabel: UILabel!
    
    
    
    func setUpCellWith(currency1: SearchFoods){
        
        NameLabel.text = currency1.description
        DescripctionLabel.text = currency1.foodCategory
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
