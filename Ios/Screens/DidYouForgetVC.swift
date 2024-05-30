//
//  DidYouForgetVC.swift
//  Ios
//
//  Created by Atakan İçel on 12.05.2024.
//

import UIKit

extension DidYouForgetVC: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let userText =  codeField.text ?? ""
        var newText = ""
        if range.length > 0 {
            let txt = NSString(string: userText)
            if txt.length > 0 {
                newText = txt.replacingCharacters(in: range, with: codeField.text!)
            }
        } else {
            newText = userText + codeField.text!
        }
        return newText.count <= MAX_LENGTH
    }

}

class DidYouForgetVC: UIViewController {
    
    @IBOutlet weak var bigTitle: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var codeField: UITextField!
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var tryAgainLabel: UILabel!
  
    let MAX_LENGTH = 10
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        let bigTitleAttribute = NSMutableParagraphStyle()
        bigTitleAttribute.lineSpacing = 5
        bigTitle.attributedText = NSAttributedString(string:
"""
E-posta gelen kutunuzu
kontrol edin
""",attributes: [NSAttributedString.Key.paragraphStyle: bigTitleAttribute])
        
        let mail : String = "deneme@gmail.com"
        let descriptionText : String =
"""
E-posta adresinizi doğrulamanız gerekiyor.
\(mail) adresine, geçerliliği 15 dakika
sonra sona erecek 6 haneli bir kod içeren bir e-posta
gönderdik. Lütfen kodu aşağıya girin.
"""
        descriptionLabel.attributedText = NSAttributedString(string: descriptionText,attributes: [NSAttributedString.Key.paragraphStyle: bigTitleAttribute])
        
        codeField.layer.cornerRadius = 4
        codeField.defaultTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25), NSAttributedString.Key.kern: CGFloat(8)]
        codeField.attributedPlaceholder = NSAttributedString(string: "000000",attributes: [NSAttributedString.Key.kern: CGFloat(8),NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25),])
        self.codeField.delegate = self
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(onPressed), for: .touchUpInside)
        let tryAgainText : String =
"""
E-postayı almadınız mı? Önemsiz veya istenmeyen
e-posta klasörlerinizi kontrol edin. Tekrar Gönder
"""
        let tryAgainTextAttributed = NSMutableAttributedString(string: tryAgainText)
        let range = (tryAgainText as NSString).range(of: "Tekrar Gönder")
        tryAgainTextAttributed.addAttribute(NSAttributedString.Key.paragraphStyle, value: bigTitleAttribute, range: range)
        let newFont = UIFont.boldSystemFont(ofSize: 15)
        tryAgainTextAttributed.addAttribute(NSAttributedString.Key.font, value: newFont, range: range)
        tryAgainTextAttributed.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white, range: range)
        tryAgainLabel.attributedText = tryAgainTextAttributed
        tryAgainLabel.isUserInteractionEnabled = true
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)) //Viewde boşluğa tıkladığımızda klavye kapanması.
               view.addGestureRecognizer(tapGesture)
        
    }
    @objc func onPressed(){
        if(codeField.text == "111111"){
            performSegue(withIdentifier: "goToNewPassword", sender: nil)
        }else{
            codeField.layer.borderWidth = 1
            codeField.layer.borderColor = UIColor.systemRed.cgColor
            let tryAgainTextred = NSMutableAttributedString(string:
"""
Üzgünüz, girdiğiniz kodu kullanarak sizi Disney+'a bağlayamadık.
Lütfen kodunuzu yeniden girip tekrar deneyin. Sorun devam ederse
Disney+ Yardım Merkezi'ni ziyaret edin (Hata Kodu 21).
""",attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemRed, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 11   )])
            tryAgainLabel.attributedText = tryAgainTextred
        }
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

