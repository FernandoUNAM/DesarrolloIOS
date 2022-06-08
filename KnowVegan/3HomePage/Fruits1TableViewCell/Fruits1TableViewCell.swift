//
//  Fruits1TableViewCell.swift
//  KnowVegan
//
//  Created by Luis Fernando Cuevas Cuauhtle on 7/6/22.
//

// MARK: LIBRARIES

import UIKit

// MARK: MAIN CLASS

class Fruits1TableViewCell: UITableViewCell {

    // MARK: CELL LIFE CYCLE
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
        // Initialization code
    }
    
    // MARK: PROPERTIES
    
    var fruitModel = [Fruits]()

    // MARK: OUTLETS

    @IBOutlet var fruits1CollectionView: UICollectionView!
    
    // MARK: ACTIONS
    
    // MARK: FUNCTIONS
 
    
    // CELL'S INITIAL CONFIGURATION
    func setUp(){
        fruits1CollectionView.register(Fruits1CollectionViewCell.nib(), forCellWithReuseIdentifier: Fruits1CollectionViewCell.identifier)
        fruits1CollectionView.delegate = self
        fruits1CollectionView.dataSource = self
    }
    
    // CELL'S SETUP WITH MODEL
    
    func setUpWith(with fruits: [Fruits]){
        self.fruitModel = fruits
        fruits1CollectionView.reloadData()
    }
    

    // MARK: OVERRIDES
    
    // CELL SELECTION'S ANIMATION
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: EXTENSIONS

extension Fruits1TableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // RETRIEVE OF COLLECTION CELLS
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Fruits1CollectionViewCell.identifier, for: indexPath) as! Fruits1CollectionViewCell
        
        cell.setUpWith(with: fruitModel[indexPath.row])
        
        return cell
    }
    
    // ELEMENTS PER COLLECTION VIES/TABLE VIEW CELL
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fruitModel.count
    }
    
}
