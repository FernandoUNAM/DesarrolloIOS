//
//  ViewControllerHomePage.swift
//  KnowVegan
//
//  Created by Donovan Z. Jaimes on 31/05/22.
//

// MARK: LIBRARIES

import UIKit

// MARK: MAIN CLASS

class ViewControllerHomePage: UIViewController {
    
    
    
    @IBOutlet weak var FoodsField: UITextField!
    
    
    
    // MARK: APP LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
        setUpTableView()
        setUpGeneralInfo()
        
    }
    
    // MARK: CONSTANTS AND VARIABLES
    
    var fruits: [Fruits] = []
    
    var fruitsArray: [FoodIDSearch] = []
    
    var fruitItem: FoodIDSearch = FoodIDSearch(fdcId: 0, description: "", publicationDate: "", foodNutrients: [])
    
    
    // MARK: OUTLETS
    @IBOutlet weak var fruitsTableView: UITableView!
    
    
    
    @IBOutlet weak var FoodSearchField: UITextField!
    
    
    
    
    // MARK: ACTIONS
    
    // DETAIL VIEW PRESENTATION
    @IBAction func ButtonDetailView(_ sender: Any) {
        let StoryboardDetailView  = UIStoryboard(name: "StoryboardDetailView", bundle: .main)
        if let ViewControllerDetailView = StoryboardDetailView.instantiateViewController(withIdentifier: "DetailViewVC") as? ViewControllerDetailView{
            
            let navigationController = UINavigationController(rootViewController: ViewControllerDetailView)
            self.present(navigationController, animated: true)
        }
    }
    
    // MARK: FUNCTIONS
    
    // INITIAL HOME PAGE CONFIGURATIONS
    func initialSetUp(){
        self.title = "INICIO"
        
        let fruitsIDs: [Int] = [168171,1102688,169910,167762,167765]
        
        var counter: Int = 1
        
        for fruitsID in fruitsIDs {
            fruitsArray.append(loadFruits(foodId: fruitsID))
            counter = counter + 1
        }
        
    }
    
    // APPEND OF WEB SERVICE ELEMENTS
    func setUpGeneralInfo(){
        
        print("\(fruitsArray[1].description)")
        
        fruits.append(Fruits(name: fruitsArray[1].description, image: "apple"))
        fruits.append(Fruits(name: "PineApple", image: "pineapple"))
        fruits.append(Fruits(name: "Mango", image: "mango"))
        fruits.append(Fruits(name: "StrawBerry", image: "strawberry"))
        fruits.append(Fruits(name: "WaterMelon", image: "watermelon"))
        
    }
    
    // MAIN TABLEVIEW CONFIGURATION
    func setUpTableView(){
        
        fruitsTableView.register(FruitsTableViewCell.nib(), forCellReuseIdentifier: FruitsTableViewCell.identifier)
        
        // DATASOURCE WOULD BE THE TABLEVIEW ITSELF
        fruitsTableView.dataSource = self
        fruitsTableView.delegate = self
        
    }
    
    // LOAD FRUITS
    func loadFruits(foodId: Int) -> FoodIDSearch{
        
        var item = FoodIDSearch(fdcId: 0, description: "", publicationDate: "", foodNutrients: [])
        
        // URL ASSIGNATION
        guard let url = URL(string: "https://api.nal.usda.gov/fdc/v1/food/\(foodId)?api_key=JsGeeOLxpfxtZnGfQeNOBaWjJChkA0cxa3bQclSs") else {
            return item
        }
        
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            
            // UNWRAPS DATA FROM URL REQUEST
            if let data = data {
                print("DATA PACKAGE SIZE: \(data)")
                print("DATA JSON STRING: \(String(decoding: data, as: UTF8.self))")
                
                item = self.decodeJSONResponse(data: data)
            
            }
            
            // UNWRAPS HTTPS RESPONSE CODE
            if let response = response {
                print("WEB SERVICE REQUEST RESPONSE: \(response)")
                
                if let urlResponse = response as? HTTPURLResponse {
                    print("HTTP RESPONSE CODE: \(urlResponse.statusCode)")
                }
            }
            
            // UWRAPS WEB SERVICE REQUEST ERROR CODE
            if let error = error {
                print("WEB SERVICE REQUEST ERROR: \(error)")
                
            }
            
            
            
        }
        
        // TASK RESUMES IN BACKGROUND
        task.resume()
        return item
    }
    
    func decodeJSONResponse(data: Data) -> FoodIDSearch{
        
        var decodedItem = FoodIDSearch(fdcId: 0, description: "", publicationDate: "", foodNutrients: [])
        
        do {
            
        let decoder = JSONDecoder()
        let results = try decoder.decode(FoodIDSearch.self, from: data)
            
            print("DECODED RESPONSE: \(results)")
            print("FRUITNAME: \(results.description)")
            
            decodedItem = results
            
            reloadTableView()
            
        } catch {
            print("DECODING PROCCESS ERROR: \(error)")
        }
        return decodedItem
    }
    
    func reloadTableView(){
        DispatchQueue.main.async {
            self.fruitsTableView.reloadData()
            self.setUpGeneralInfo()
        }
    }
    

    @IBAction func ButtonFoodSearch(_ sender: Any) {
        guard let food = FoodsField.text, !food.isEmpty
        else {return}
        
        
        goToStoryboardFoodSearch()
    }
    
    
    func goToStoryboardFoodSearch(){
        let StoryboardFoodSearch  = UIStoryboard(name: "StoryboardFoodSearch", bundle: .main)
        if let ViewControllerFoodSearch = StoryboardFoodSearch.instantiateViewController(withIdentifier: "FoodSearchVC") as? ViewControllerFoodSearch{
            if let frutName = FoodsField.text {
                
                ViewControllerFoodSearch.nameFood = "\(frutName)"
                
            }else {
                
                print ("TEXT FIELD ERROR")
                
            }
            
            self.navigationController?.pushViewController(ViewControllerFoodSearch, animated: true)
        }
        
    }
    
    
}

// MARK: EXTENSIONS

// TABLE VIEW DELEGATE MANIPULATOR AND DATASOURCE

extension ViewControllerHomePage: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // NUMBER OF ROWS IN SECTION
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: FruitsTableViewCell.identifier, for: indexPath) as? FruitsTableViewCell {
            
            // GO TROUGH ARRAY'S ITEMS AND ASSIGNS THEM TO A CELL RESPECTIVE ROW
            cell.setUpWith(with: fruitsArray[indexPath.row])
            
            return cell
        }
        return UITableViewCell()
    }
    /*
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
     */
    
}
