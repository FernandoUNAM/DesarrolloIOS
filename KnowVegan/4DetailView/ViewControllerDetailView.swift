//
//  ViewControllerDetailView.swift
//  KnowVegan
//
//  Created by Donovan Z. Jaimes on 31/05/22.
//

// MARK: FRAMEWORKS & LIBRARIES

import UIKit
import Foundation

// MARK: MAIN VIEW CONTROLLER

class ViewControllerDetailView: UIViewController {

    // MARK: PROPERTIES (CONSTANTS & VARIABLES)
    var IDFrut: String = ""
    var fruitImage: [String] = []
    var FruitModel =  FoodIDSearch(fdcId: 0, description: "", publicationDate: "", foodNutrients: [])
    var FruitNutrientsModel: FruitNutrients = FruitNutrients(nutrient: Nutrient(id: 0, number: "", name: "", rank: 0, unitName: ""), type: "", id: 0, amount: 0)
    var FruitNutrientModel: Nutrient = Nutrient(id: 0, number: "", name: "", rank: 0, unitName: "")
    
    var proteinAmount: String = "No data Received"
    var fiberAmount: String = "No data Received"
    var carbsAmount: String = "No data Received"
    
    // MARK: APP LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        loadFruit(foodID: IDFrut)
        setUpUI()
    }
    
    // MARK: OUTLETS
    @IBOutlet weak var fruitImageView: UIImageView!
    @IBOutlet weak var fruitNameLabel: UILabel!
    @IBOutlet weak var fibraLabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var carbsLabel: UILabel!
    // MARK: ACTIONS
    
    // MARK: FUNCTIONS
    
    func setUpUI(){
        self.title = "FRUTAS"
    }
    
    func setUpGeneralInfo(){
        
        let nutrients: [FruitNutrients] = FruitModel.foodNutrients
        
        for nutrient in nutrients {
            
            if nutrient.id == 21115520 {
                proteinAmount = nutrient.nutrient.number
            }
            if nutrient.id == 21115481 {
                fiberAmount = nutrient.nutrient.number
            }
            if nutrient.id == 21115521 {
                carbsAmount = nutrient.nutrient.number
            }

        }
        
        fruitNameLabel.text = FruitModel.description
        
        fibraLabel.text = fiberAmount
        proteinLabel.text = proteinAmount
        carbsLabel.text = carbsAmount
    }
    
    // LOAD FRUITS
    func loadFruit(foodID: String){

        // URL ASSIGNATION
        guard let url = URL(string: "https://api.nal.usda.gov/fdc/v1/food/\(foodID)?api_key=JsGeeOLxpfxtZnGfQeNOBaWjJChkA0cxa3bQclSs") else {return}
        
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
            FruitModel = results
            reloadData()
        } catch {
            print("DECODING PROCCESS ERROR: \(error)")
        }
    }
    
    func reloadData(){
        DispatchQueue.main.async {
            self.setUpGeneralInfo()
        }
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
