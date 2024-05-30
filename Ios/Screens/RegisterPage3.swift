//
//  RegisterPage3.swift
//  Ios
//
//  Created by Atakan İçel on 10.05.2024.
//

import UIKit

class RegisterPage3: UIViewController {

    @IBOutlet weak var textlabel1: UILabel!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var textLabel2: UILabel!
    
    @IBOutlet weak var mailReminderLabel: UILabel!
    
    @IBOutlet weak var mailLabel: UILabel!
    
    @IBOutlet weak var mailReminderLabelsView: UIView!
    
    @IBOutlet weak var registerButton: UIButton!
    
    //var mail : NSAttributedString?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let text1Paragraph = NSMutableParagraphStyle()
        text1Paragraph.lineSpacing = 5
        let labelText1attributed = NSAttributedString(string:
"""
Bu e-postayı ve parolayı Disney+ hesabınızda oturum
açarak favori programlarınızı ve filmlerinizi izlemek için
kullanıcaksınız.
""", attributes: [NSAttributedString.Key.paragraphStyle: text1Paragraph])
        textlabel1.attributedText = labelText1attributed

        let text2Paragraph = NSMutableParagraphStyle()
        text2Paragraph.lineSpacing = 4
        let labelText2attributed = NSAttributedString(string:
"""
Şu karakter türlerinden 2 tanesini içeren minimum 6 karakter
(büyük/küçük harfe duyarlı) kullanın: harfler, rakamlar, özel
karakterler.
""", attributes: [NSAttributedString.Key.paragraphStyle: text2Paragraph])
        textLabel2.attributedText = labelText2attributed
        textLabel2.font = .systemFont(ofSize: 11)
        
       let  mail = NSAttributedString(string: "deneme@gmail.com", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        let mailReminderText  = NSAttributedString(string:"Oturum açmak için şu e-postayı kullanıcaksınız:"
,attributes: [NSAttributedString.Key.paragraphStyle: text1Paragraph])
        
        mailReminderLabel.attributedText = mailReminderText
        mailReminderLabel.font = .systemFont(ofSize: 14)
        
    
        mailLabel.attributedText = mail
        mailLabel.font = .systemFont(ofSize: 15)
        
        let mailReminderLabelsViewBorder = UIView(frame: CGRectMake(0, 0, 1.5 , mailReminderLabelsView.frame.height))
        mailReminderLabelsViewBorder.backgroundColor = UIColor.gray
        
        mailReminderLabelsView.addSubview(mailReminderLabelsViewBorder)
        
        registerButton.titleLabel?.font = .systemFont(ofSize: 16)
        registerButton.layer.cornerRadius = 5
        registerButton.addTarget(self, action: #selector(registerAction), for: .touchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)) //Viewde boşluğa tıkladığımızda klavye kapanması.
               view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
           view.endEditing(true)
       }
    @objc func registerAction(){
        performSegue(withIdentifier: "toProfile", sender: nil)
        
    }
    //back button
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         let backItem = UIBarButtonItem()
             backItem.title = " "
             navigationItem.backBarButtonItem = backItem
     }
}
