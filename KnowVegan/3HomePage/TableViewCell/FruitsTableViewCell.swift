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
    
    @IBOutlet weak var fruitImage: UIImageView!
    @IBOutlet weak var fruitName: UILabel!
    @IBOutlet weak var elementsCollectionView: UICollectionView!
    
    // MARK: ACTIONS
    
    // MARK: FUNCTIONS
    
    // CELL'S INITIAL CONFIGURATION
    func setUpUI(){
        fruitImage.image = UIImage(named: "AppleFruit")
    }
    
    // SET UP CELL DATA WITH
    
    func setUpCellWith(fruit: FoodIDSearch){
        
        fruitName.text = fruit.description
        
    }
    
    
    // MARK: OVERRIDES
    
    // CELL SELECTION'S ANIMATION
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: EXTENSIONS

extension FruitsTableViewCell {
    
    var collectionViewOffset: CGFloat {
        set { elementsCollectionView.contentOffset.x = newValue }
        get { return elementsCollectionView.contentOffset.x }
    }
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int){
        
        elementsCollectionView.delegate = dataSourceDelegate
        elementsCollectionView.dataSource = dataSourceDelegate
        elementsCollectionView.tag = row
        elementsCollectionView.setContentOffset(elementsCollectionView.contentOffset, animated: false)
        elementsCollectionView.reloadData()
        
    }
    
}
