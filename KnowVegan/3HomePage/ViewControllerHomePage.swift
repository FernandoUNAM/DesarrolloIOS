//
//  ViewControllerHomePage.swift
//  KnowVegan
//
//  Created by Donovan Z. Jaimes on 31/05/22.
//

import UIKit

class ViewControllerHomePage: UIViewController {
    
    var intre: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "INICIO"
        print ("\(intre)")

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ButtonDetailView(_ sender: Any) {
        let StoryboardDetailView  = UIStoryboard(name: "StoryboardDetailView", bundle: .main)
        if let ViewControllerDetailView = StoryboardDetailView.instantiateViewController(withIdentifier: "DetailViewVC") as? ViewControllerDetailView{
            //ViewControllerSignUp.modalPresentationStyle = .fullScreen
            //ViewControllerSignUp.string1 = "envio de informacion"
            let navigationController = UINavigationController(rootViewController: ViewControllerDetailView)
            self.present(navigationController, animated: true)
            
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
