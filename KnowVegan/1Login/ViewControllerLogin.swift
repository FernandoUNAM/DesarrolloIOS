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
        setUpUI()
        startUpParameters ()
    }
    
    // MARK: PROPERTIES (CONSTANTS & VARIABLES)
    
    let dataManager = CoreDataManager()
    
    let primaryColor = UIColor(red: 0.13, green: 0.57, blue: 0.64, alpha: 1.00)
    let blackColorForString = [NSAttributedString.Key.font:UIFont(name: "HelveticaNeue-Bold", size: 28),NSAttributedString.Key.foregroundColor: UIColor.black]
    let blueColorForString = [NSAttributedString.Key.font:UIFont(name: "HelveticaNeue-Bold", size: 28),NSAttributedString.Key.foregroundColor: UIColor.init(red: 0.13, green: 0.57, blue: 0.64, alpha: 1.00)]
    
    // TITLE STYLE
    var knowString = NSMutableAttributedString()
    var veganString = NSMutableAttributedString()
    
    // MARK: OUTLETS
    @IBOutlet weak var knowVeganTitle: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
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
    
    // MARK: FUNCTIONS
    
    func setUpUI(){
        
        knowString = NSMutableAttributedString(string: "KNOW ", attributes: blackColorForString as [NSAttributedString.Key : Any])
        veganString = NSMutableAttributedString(string: "VEGAN", attributes: blueColorForString as [NSAttributedString.Key : Any])
        
        knowString.append(veganString)
        self.knowVeganTitle.attributedText = knowString
        
        self.title = ""
        
    }
    
    func startUpParameters (){
        ButtonHomePage1.layer.cornerRadius = 24
        PasswordField.isSecureTextEntry = true
        
    }

    func goToStoryboardHomePage(){
        let StoryboardHomePage  = UIStoryboard(name: "StoryboardHomePage", bundle: .main)
        if let ViewControllerHomePage = StoryboardHomePage.instantiateViewController(withIdentifier: "HomePageVC") as? ViewControllerHomePage{
            self.navigationController?.pushViewController(ViewControllerHomePage, animated: true)
        }
        
    }
    
    

}
