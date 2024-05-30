//
//  LoginScreenVC.swift
//  Ios
//
//  Created by Atakan İçel on 9.05.2024.
//

import UIKit

class LoginScreenVC: UIViewController {

    @IBOutlet weak var textLabel1: UILabel!
    
    @IBOutlet weak var mailTextField: UITextField!
    
    @IBOutlet weak var goButton: UIButton!
    
    @IBOutlet weak var textLabel2: UILabel!
    
    @IBOutlet weak var goRegisterButton: UIButton!
    
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
        
        mailTextField.layer.borderWidth = 0.3
        mailTextField.layer.borderColor = UIColor.lightGray.cgColor
        mailTextField.layer.cornerRadius = 3
        
        goButton.layer.cornerRadius = 5
        goButton.addTarget(self, action: #selector(goButtonAction), for: .touchUpInside)
        
        textLabel2.text =  "Disney+'ta yeni misiniz?"
        
        goRegisterButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        goRegisterButton.addTarget(self, action: #selector(goToRegister), for: .touchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)) //Viewde boşluğa tıkladığımızda klavye kapanması.
               view.addGestureRecognizer(tapGesture)
    }
    @objc func goToRegister(){
        performSegue(withIdentifier: "goToRegister", sender: nil)
    }
    @objc func goButtonAction(){
        performSegue(withIdentifier: "goToLoginPage2", sender: nil)
    }
    //back button
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         let backItem = UIBarButtonItem()
             backItem.title = " "
             navigationItem.backBarButtonItem = backItem
     }
    @objc func dismissKeyboard() {
           view.endEditing(true)
       }
}
