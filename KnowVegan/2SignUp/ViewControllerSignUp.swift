//
//  ViewControllerSignUp.swift
//  KnowVegan
//
//  Created by Donovan Z. Jaimes on 31/05/22.
//

// MARK: FRAMEWORKS & LIBRARIES

import UIKit

// MARK: SIGN UP STORYBOARD VIEW CONTROLLER

class ViewControllerSignUp: UIViewController {
    
    // MARK: PROPERTIES (VARIABLES & CONSTANTS)
    
    let dataManager = CoreDataManager()
    let primaryColor = UIColor(red: 0.13, green: 0.57, blue: 0.64, alpha: 1.00)
    var string1: String = ""
    let viewsCornerRadious: CGFloat = 24
    
    // MARK: OUTLETS
    
    @IBOutlet weak var ButtonHomePage2: UIButton!
    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var UserField: UITextField!
    @IBOutlet weak var MailField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    @IBOutlet weak var ConfirmPasswordField: UITextField!
    @IBOutlet weak var WarningLabel: UILabel!
    
    // MARK: MAIN FUNCTION OF APP LIFE CYCLE

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        self.title = "REGISTRO"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: primaryColor]
        print (string1)
        PasswordField.isSecureTextEntry = true
        ConfirmPasswordField.isSecureTextEntry = true
    }
    
    // MARK: ACTIONS
    
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
    
    // MARK: FUNCTIONS
    
    func setUpUI(){
        NameField.keyboardType = .default
        UserField.keyboardType = .default
        MailField.keyboardType = .emailAddress
        PasswordField.keyboardType = .default
        ConfirmPasswordField.keyboardType = .default
        
        ButtonHomePage2.backgroundColor = primaryColor
        ButtonHomePage2.layer.cornerRadius = viewsCornerRadious
        NameField.layer.cornerRadius = viewsCornerRadious
        UserField.layer.cornerRadius = viewsCornerRadious
        MailField.layer.cornerRadius = viewsCornerRadious
        PasswordField.layer.cornerRadius = viewsCornerRadious
        ConfirmPasswordField.layer.cornerRadius = viewsCornerRadious
        
    }
    
    
    func goToStoryboardHomePage(){
        let StoryboardHomePage  = UIStoryboard(name: "StoryboardHomePage", bundle: .main)
        if let ViewControllerHomePage = StoryboardHomePage.instantiateViewController(withIdentifier: "HomePageVC") as? ViewControllerHomePage{
            self.navigationController?.pushViewController(ViewControllerHomePage, animated: true)
        }
        
        
    }
    
}
