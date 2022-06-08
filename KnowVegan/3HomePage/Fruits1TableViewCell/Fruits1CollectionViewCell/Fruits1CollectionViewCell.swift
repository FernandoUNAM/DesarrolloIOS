//
//  Fruits1CollectionViewCell.swift
//  KnowVegan
//
//  Created by Luis Fernando Cuevas Cuauhtle on 7/6/22.
//


// MARK: LIBRARIES

import UIKit

// MARK: MAIN CLASS

class Fruits1CollectionViewCell: UICollectionViewCell {

    // MARK: APP LIFE CYCLE
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    // MARK: PROPERTIES (VARIABLES & CONSTANTS)
    
    // COLLECTION VIEW IDENTIIER
    static let identifier = "Fruits1CollectionViewCell"
    
    // MARK: OUTLETS
    
    @IBOutlet weak var fruitName: UILabel!
    @IBOutlet weak var fruitImage: UIImageView!
    
    // MARK: ACTIONS
    
    // MARK: FUNCTIONS
    
    // COLLECTION VIEW CELL NIB
    static func nib() -> UINib {
        return UINib(nibName: "Fruits1CollectionViewCell", bundle: nil)
    }
    
    // COLLECTION VIEW CELL SETUP
    
    public func setUpWith(with fruit: Fruits){
        self.fruitName.text = fruit.fruitName
        self.fruitImage.image = UIImage(named: fruit.fruitImage)
    }
    
    
    
    

}
