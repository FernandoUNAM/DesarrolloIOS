//
//  ViewControllerSignUp.swift
//  KnowVegan
//
//  Created by Donovan Z. Jaimes on 31/05/22.
//

import UIKit

class ViewControllerSignUp: UIViewController {
    
    
    @IBOutlet weak var ButtonHomePage2: UIButton!
    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var UserField: UITextField!
    @IBOutlet weak var MailField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    @IBOutlet weak var ConfirmPasswordField: UITextField!
    @IBOutlet weak var WarningLabel: UILabel!
    
    
    var string1: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "REGISTRO"
        print (string1)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ButtonHomePage(_ sender: Any) {
        
        guard let name = NameField.text, !name.isEmpty,
              let user = UserField.text, !user.isEmpty,
              let mail = MailField.text, !mail.isEmpty,
              let password = PasswordField.text, !password.isEmpty,
              let CPassword = ConfirmPasswordField.text, !CPassword.isEmpty
        else {
            WarningLabel.text = "datos incorrectos"
            WarningLabel.textColor = .red
            return}
        
        
        
        
        let StoryboardHomePage  = UIStoryboard(name: "StoryboardHomePage", bundle: .main)
        if let ViewControllerHomePage = StoryboardHomePage.instantiateViewController(withIdentifier: "HomePageVC") as? ViewControllerHomePage{
            //ViewControllerHomePage.intre = 5
            self.navigationController?.pushViewController(ViewControllerHomePage, animated: true)
        }
        
        
        
        
    }
    
    
    func setUpUI(){
        NameField.keyboardType = .default
        UserField.keyboardType = .default
        MailField.keyboardType = .emailAddress
        PasswordField.keyboardType = .default
        ConfirmPasswordField.keyboardType = .default
        
        
    }


}
