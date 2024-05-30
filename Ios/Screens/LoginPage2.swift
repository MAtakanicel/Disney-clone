//
//  LoginPage2.swift
//  Ios
//
//  Created by Atakan İçel on 11.05.2024.
//

import UIKit

class LoginPage2: UIViewController {

    @IBOutlet weak var textLabel1: UILabel!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var didYouForgetButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let paragraphAttribute1 = NSMutableParagraphStyle()
        paragraphAttribute1.lineSpacing = 5
        let textLabelText1 = NSAttributedString(string:
        """
Bu e-postayı ve parolayı Disney+ hesabınızda oturum
açarak favori programlarınızı ve filmlerinizi izlemek için
kullanıcaksınız.
""", attributes: [NSAttributedString.Key.paragraphStyle: paragraphAttribute1] )
        textLabel1.attributedText = textLabelText1
        
        passwordField.layer.borderWidth = 0.4
        passwordField.layer.borderColor = UIColor.lightGray.cgColor
        passwordField.layer.cornerRadius = 5
     
        loginButton.layer.cornerRadius = 5
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        didYouForgetButton.titleLabel?.font = .systemFont(ofSize: 12)
        didYouForgetButton.addTarget(self, action: #selector(didYouForget), for: .touchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)) //Viewde boşluğa tıkladığımızda klavye kapanması.
               view.addGestureRecognizer(tapGesture)
    }
    @objc func didYouForget(){
        performSegue(withIdentifier: "didYouForgetSegue", sender: nil)
    }
    @objc func login(){
        performSegue(withIdentifier: "toProfile", sender: nil)
    }
    
    @objc func dismissKeyboard() {
           view.endEditing(true)
       }
    //back button
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         let backItem = UIBarButtonItem()
             backItem.title = " "
             navigationItem.backBarButtonItem = backItem
     }
}
