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
        setUp()
        // Initialization code
    }
    
    // MARK: PROPERTIES
    
    var fruitModel = [Fruits]()
    static let identifier = "FruitsTableViewCell"
    
    // MARK: OUTLETS

    @IBOutlet var fruitsCollectionView: UICollectionView!
    @IBOutlet weak var sectionName: UILabel!
    
    // MARK: ACTIONS
    
    // MARK: FUNCTIONS
    
    // NIB
    
    static func nib() -> UINib {
        return UINib(nibName: "FruitsTableViewCell", bundle: nil)
    }
    
    // CELL'S INITIAL CONFIGURATION
    func setUp(){
        fruitsCollectionView.register(FruitsCollectionViewCell.nib(), forCellWithReuseIdentifier: FruitsCollectionViewCell.identifier)
        fruitsCollectionView.delegate = self
        fruitsCollectionView.dataSource = self
    }
    
    // CELL'S SETUP WITH MODEL
    
    func setUpWith(with fruits: [Fruits]){
        self.fruitModel = fruits
        fruitsCollectionView.reloadData()
    }

    // MARK: OVERRIDES
    
    // CELL SELECTION'S ANIMATION
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: EXTENSIONS

extension FruitsTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // RETRIEVE OF COLLECTION CELLS
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FruitsCollectionViewCell.identifier, for: indexPath) as! FruitsCollectionViewCell
        
        cell.setUpWith(with: fruitModel[indexPath.row])
        
        return cell
    }
    
    // ELEMENTS PER COLLECTION VIES/TABLE VIEW CELL
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fruitModel.count
    }
    
    // COLLECTION VIEW LAYOUT
    /*
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 250)
    }
    */
    
    
}
