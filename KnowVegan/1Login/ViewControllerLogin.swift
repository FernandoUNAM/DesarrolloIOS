//
//  ViewControllerLogin.swift
//  KnowVegan
//
//  Created by Donovan Z. Jaimes on 31/05/22.
//

import UIKit

class ViewControllerLogin: UIViewController {
    
    
    
    
    @IBOutlet weak var ButtonHomePage1: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
        searchFruts()
        startUpParameters ()
        print ("luchis es mi mejor enemigo")

    }
    
    
    
    @IBAction func IniciarSesion(_ sender: Any) {
        let StoryboardSignUp  = UIStoryboard(name: "StoryboardSignUp", bundle: .main)
        if let ViewControllerSignUp = StoryboardSignUp.instantiateViewController(withIdentifier: "SignUpVC") as? ViewControllerSignUp{
            //ViewControllerSignUp.modalPresentationStyle = .fullScreen
            ViewControllerSignUp.string1 = "envio de informacion"
            let navigationController = UINavigationController(rootViewController: ViewControllerSignUp)
            navigationController.modalPresentationStyle = .fullScreen
            self.present(navigationController, animated: true)
            
        }
    }
    
    @IBAction func ButtonHomePage(_ sender: Any) {
        let StoryboardHomePage  = UIStoryboard(name: "StoryboardHomePage", bundle: .main)
        if let ViewControllerHomePage = StoryboardHomePage.instantiateViewController(withIdentifier: "HomePageVC") as? ViewControllerHomePage{
            ViewControllerHomePage.intre = 5
            self.navigationController?.pushViewController(ViewControllerHomePage, animated: true)

            
        }
        
        
    }
    
    
    func searchFruts(){
        guard let url  = URL(string: "https://api.nal.usda.gov/fdc/v1/food/1750340?api_key=JsGeeOLxpfxtZnGfQeNOBaWjJChkA0cxa3bQclSs") else {return}
        
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            if let data = data {
                print ("DATA: \(data)")
                //print ("STRING: \(String(decoding: data, as: UTF8.self))")
                self.decodeJSONResponse(data: data)
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
    
    func decodeJSONResponse (data: Data){

        
        do {
            let decoder = JSONDecoder()
            let response = try decoder.decode(SearchGeneral.self, from: data)
            print ("DECODER RESPONSE: \(response.foodNutrients)")
            
            
            
        }catch {
            print ("ERROR: \(error)")
        }
    }
    
    
    func startUpParameters (){
        ButtonHomePage1.layer.cornerRadius = 24
        
    }
    
    
    /*
    func searchFrutsImagen(){
        //guard let url  = URL(string: "https://api.nal.usda.gov/fdc/v1/food/1750340?api_key=JsGeeOLxpfxtZnGfQeNOBaWjJChkA0cxa3bQclSs") else {return}
        
        
        
        guard let url = URL(string: "https://trackapi.nutritionix.com/v2/search/instant?query=apple") else {return}
                
        request.httpMethod = "GET"
        request.setValue("e5c37150", forHTTPHeaderField: "x-app-id")
        request.setValue("cd834010f366cdaa94a4a79a6d858a9e", forHTTPHeaderField: "x-app-key")
        
        
        
        
        
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
    
    func decodeJSONResponse2 (data: Data){

        
        do {
            let decoder = JSONDecoder()
            let response = try decoder.decode(SearchGeneral.self, from: data)
            print ("DECODER RESPONSE: \(response.foodNutrients)")
            
            
            
        }catch {
            print ("ERROR: \(error)")
        }
    }
    
    
    */


    

}
