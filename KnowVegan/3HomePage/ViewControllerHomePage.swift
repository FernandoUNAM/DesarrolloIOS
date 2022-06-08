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
    
    
    
    
    
    // MARK: OUTLETS
    @IBOutlet weak var fruits1TableView: UITableView!
    @IBOutlet weak var FoodSearchField: UITextField!
    @IBOutlet weak var FoodsField: UITextField!
    
    
    // MARK: APP LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFruits()
        setUpGeneralInfo()
        setUpUI()
        setUpTableView()
    }

    // MARK: CONSTANTS AND VARIABLES
    
    var fruits: [Fruits] = []
    var appleFruit: FoodIDSearch = FoodIDSearch(fdcId: 0, description: "", publicationDate: "", foodNutrients: [])

    
    
    
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
    func setUpUI(){
        self.title = "INICIO"
    }
    
    // APPEND OF WEB SERVICE ELEMENTS
    func setUpGeneralInfo(){
        fruits.append(Fruits(name: "Apple", image: "Apple"))
        fruits.append(Fruits(name: "PineApple", image: "Pineapple"))
        fruits.append(Fruits(name: "Mango", image: "Mango"))
        fruits.append(Fruits(name: "StrawBerry", image: "Strawberry"))
        fruits.append(Fruits(name: "WaterMelon", image: "Watermelon"))
    }
    
    // MAIN TABLEVIEW CONFIGURATION
    
    func setUpTableView(){
        fruits1TableView.register(UINib(nibName: "Fruits1TableViewCell", bundle: nil), forCellReuseIdentifier: "Fruits1TableViewCell")
        // DATASOURCE WOULD BE THE TABLEVIEW ITSELF
        fruits1TableView.dataSource = self
        fruits1TableView.delegate = self
        
        
    }
    
    
    
    // LOAD FRUITS
    func loadFruits(){

        // URL ASSIGNATION
        guard let url = URL(string: "https://api.nal.usda.gov/fdc/v1/food/1102644?api_key=JsGeeOLxpfxtZnGfQeNOBaWjJChkA0cxa3bQclSs") else {return}
        
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            
            // UNWRAPS DATA FROM URL REQUEST
            if let data = data {
                print("DATA PACKAGE SIZE: \(data)")
                print("DATA JSON STRING: \(String(decoding: data, as: UTF8.self))")
                
                self.decodeJSONResponse(data: data)
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
        
    }
    
    func decodeJSONResponse(data: Data){
        
        do {
            
        let decoder = JSONDecoder()
        let results = try decoder.decode(FoodIDSearch.self, from: data)
            
            print("DECODED RESPONSE: \(results)")
            print("FRUITNAME: \(results.description)")
            
            appleFruit = results

            
            reloadTableView()
        } catch {
            print("DECODING PROCCESS ERROR: \(error)")
        }
    }
    
    func reloadTableView(){
        DispatchQueue.main.async {
            self.setUpGeneralInfo()
            self.fruits1TableView.reloadData()
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

// MARK: EXTENSIONS

// TABLE VIEW DELEGATE MANIPULATOR AND DATASOURCE

extension ViewControllerHomePage: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // NUMBER OF ROWS IN SECTION
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Fruits1TableViewCell", for: indexPath) as? Fruits1TableViewCell {
            
            // GO TROUGH ARRAY'S ITEMS AND ASSIGNS THEM TO A CELL RESPECTIVE ROW
            cell.setUpWith(with: fruits)
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
    
}
