//
//  ViewControllerSignUp.swift
//  KnowVegan
//
//  Created by Donovan Z. Jaimes on 31/05/22.
//

import UIKit

class ViewControllerSignUp: UIViewController {
    
    
    let dataManager = CoreDataManager()
    
    @IBOutlet weak var ButtonHomePage2: UIButton!
    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var UserField: UITextField!
    @IBOutlet weak var MailField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    @IBOutlet weak var ConfirmPasswordField: UITextField!
    @IBOutlet weak var WarningLabel: UILabel!
    
    let primaryColor = UIColor(red: 0.13, green: 0.57, blue: 0.64, alpha: 1.00)
    var string1: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "REGISTRO"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: primaryColor]
        print (string1)
        PasswordField.isSecureTextEntry = true
        ConfirmPasswordField.isSecureTextEntry = true
        setUpUI()
        
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
        
        if password != CPassword {
            WarningLabel.text = "Contraseñas incorrectas"
            WarningLabel.textColor = .red
        }
        
        
        if password == CPassword {
            dataManager.saveUser(userName: user, userPassword: password)
            NameField.text = ""
            UserField.text = ""
            MailField.text = ""
            PasswordField.text = ""
            ConfirmPasswordField.text = ""
            goToStoryboardHomePage()
            WarningLabel.text = "Registro Correcto"
        }

    }
    
    
    func setUpUI(){
        NameField.keyboardType = .default
        UserField.keyboardType = .default
        MailField.keyboardType = .emailAddress
        PasswordField.keyboardType = .default
        ConfirmPasswordField.keyboardType = .default
        ButtonHomePage2.layer.cornerRadius = 24
        ButtonHomePage2.backgroundColor = primaryColor
    }
    
    
    func goToStoryboardHomePage(){
        let StoryboardHomePage  = UIStoryboard(name: "StoryboardHomePage", bundle: .main)
        if let ViewControllerHomePage = StoryboardHomePage.instantiateViewController(withIdentifier: "HomePageVC") as? ViewControllerHomePage{
            self.navigationController?.pushViewController(ViewControllerHomePage, animated: true)
        }
        
        
    }
    
}
