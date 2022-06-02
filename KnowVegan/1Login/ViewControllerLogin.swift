//
//  ViewControllerLogin.swift
//  KnowVegan
//
//  Created by Donovan Z. Jaimes on 31/05/22.
//
// MARK: LIBRARIES

import UIKit

// MARK: MAIN CLASS

class ViewControllerLogin: UIViewController {
    
    // MARK: APP LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = ""
        startUpParameters ()
        PasswordField.isSecureTextEntry = true
    }
    
    // MARK: PROPERTIES (CONSTANTS & VARIABLES)
    
    let dataManager = CoreDataManager()
    
    // MARK: OUTLETS
    @IBOutlet weak var ButtonHomePage1: UIButton!
    @IBOutlet weak var UserField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    @IBOutlet weak var SwitchUser: UISwitch!
    @IBOutlet weak var WarningLabel2: UILabel!
    
    // MARK: ACTIONS
    
    // SIGN UP (REGISTRO)
    
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
    
    // SIGN IN (INICIO DE SESIÓN)
    
    @IBAction func ButtonHomePage(_ sender: Any) {
        
        guard let user = UserField.text, !user.isEmpty,
              let password = PasswordField.text, !password.isEmpty
        else {
            WarningLabel2.text = "Datos Incompletos"
            return}
        
        
        let newContact = dataManager.readUser()
        for cont in newContact {
            
            if cont.userName == user && cont.userPassword == password {
                if SwitchUser.isOn {
                    UserField.text = cont.userName
                    PasswordField.text = cont.userPassword
                }else {
                    UserField.text = ""
                    PasswordField.text = ""
                }
                WarningLabel2.text = ""
                goToStoryboardHomePage()
                break
            } else{
                WarningLabel2.text = "Contraseña o Usuario incorrecto"
                
            }

        }
        
    }
    
    func startUpParameters (){
        ButtonHomePage1.layer.cornerRadius = 24
        
    }

    func goToStoryboardHomePage(){
        let StoryboardHomePage  = UIStoryboard(name: "StoryboardHomePage", bundle: .main)
        if let ViewControllerHomePage = StoryboardHomePage.instantiateViewController(withIdentifier: "HomePageVC") as? ViewControllerHomePage{
            self.navigationController?.pushViewController(ViewControllerHomePage, animated: true)
        }
        
    }
    
    

}
