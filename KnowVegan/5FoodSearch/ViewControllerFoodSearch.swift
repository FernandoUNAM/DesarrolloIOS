//
//  ViewControllerFoodSearch.swift
//  KnowVegan
//
//  Created by Donovan Z. Jaimes on 02/06/22.
//

import UIKit
import Foundation

class ViewControllerFoodSearch: UIViewController {

    var currencies: [SearchFoods] = []
    //var currencies: [SearchFoods]? = []
    
    @IBOutlet weak var searchItemsTableView: UITableView!
    
    @IBOutlet weak var Label1: UILabel!
    
    var IDPass: String = ""
    var nameFood: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Busqueda"
        

        
        
        
        print (nameFood)
        SearchNewFood(food: nameFood)
        setUpTableView()
        //setUpTableView()

        // Do any additional setup after loading the view.
    }
    

    func SearchNewFood(food: String){
        //guard let url  = URL(string: "https://api.nal.usda.gov/fdc/v1/foods/search?query=beans&dataType=Foundation&pageSize=50&sortBy=dataType.keyword&sortOrder=asc&api_key=JsGeeOLxpfxtZnGfQeNOBaWjJChkA0cxa3bQclSs") else {return}
        
        guard let url  = URL(string: "https://api.nal.usda.gov/fdc/v1/foods/search?query=\(food)&dataType=Foundation&pageSize=50&sortBy=dataType.keyword&sortOrder=asc&api_key=JsGeeOLxpfxtZnGfQeNOBaWjJChkA0cxa3bQclSs") else {return}
        print ("https://api.nal.usda.gov/fdc/v1/foods/search?query=\(food)&dataType=Foundation&pageSize=50&sortBy=dataType.keyword&sortOrder=asc&api_key=JsGeeOLxpfxtZnGfQeNOBaWjJChkA0cxa3bQclSs")
        
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            if let data = data {
                print ("DATA: \(data)")
                //print ("STRING: \(String(decoding: data, as: UTF8.self))")
                self.decodeJSONResponse2(data: data)
            }
            if let response = response {
                print ("RESPONSE \(response)")
            }
            if let error = error{
                print ("ERROR \(error)")
            }
        }
        task.resume()
        
    }
    
    func decodeJSONResponse2(data: Data){

        
        do {
            let decoder = JSONDecoder()
            let response = try decoder.decode(FoodSearch.self, from: data)
            print ("DECODER RESPONSE: \(response.foods)")
            
            currencies = response.foods
            //Label1.text = "\(currencies[1])"
            
            

            
            reloadTableView()
            
        }catch {
            print ("ERROR: \(error)")
        }
    }
    
    func setUpTableView(){
        
        searchItemsTableView.register(UINib(nibName: "FoodSearchTableViewCell", bundle: .main), forCellReuseIdentifier: "FoodSearchTableViewCell")
        
        // DATASOURCE WOULD BE THE TABLEVIEW ITSELF
        searchItemsTableView.dataSource = self
        searchItemsTableView.delegate = self
        
        
    }
    
    func reloadTableView(){
        DispatchQueue.main.async {
            self.searchItemsTableView.reloadData()
        }
    }
    
    func goToStoryboardDetailView1(){

        let StoryboardDetailView  = UIStoryboard(name: "StoryboardDetailView", bundle: .main)
        if let ViewControllerDetailView = StoryboardDetailView.instantiateViewController(withIdentifier: "DetailViewVC") as? ViewControllerDetailView{
            //ViewControllerSignUp.modalPresentationStyle = .fullScreen
            //ViewControllerSignUp.string1 = "envio de informacion"
            ViewControllerDetailView.IDFrut = IDPass
            let navigationController = UINavigationController(rootViewController: ViewControllerDetailView)
            self.present(navigationController, animated: true)
        }
        
    }

    
    func labelShowResutls(){
        if currencies.count == 0 {
            Label1.text = "No se encuentran resultados"
        }else {
            
            Label1.text = "Elija el alimento"
        }
        
    }
    

}




extension ViewControllerFoodSearch: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    
    // NUMBER OF CELL PER SECTION
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        labelShowResutls()
        
        
        return currencies.count
        //return 6
    }
    
    // ASSIGNMENT OF DATA TO CELL
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // TAKES REUSABLE CELL DEFINED IN TABLEVIEW SETUP AND ASSIGNS VALUES
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FoodSearchTableViewCell", for: indexPath) as? FoodSearchTableViewCell {
            //print ("holi")
            //print ("ERROR: \(currencies[indexPath.row])")
            let food = currencies[indexPath.row]
            cell.setUpCellWith(currency1: food)

            return cell
        
        }
        
        return UITableViewCell()
    }

    

    
    
}
extension ViewControllerFoodSearch: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let foodID = currencies[indexPath.row]
        //Label1.text = foodID.foodCategory
        print ("CONTACT SELECT: \(foodID.fdcId)")
        tableView.deselectRow(at: indexPath, animated: false)
        
        //ViewControllerSignUp.string1 = "envio de informacion"
        
        IDPass = "\(foodID.fdcId)"
        goToStoryboardDetailView1()
    }
    
    
}



