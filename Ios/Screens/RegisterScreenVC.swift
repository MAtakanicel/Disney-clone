//
//  RegisterScreenVC.swift
//  Ios
//
//  Created by Atakan İçel on 9.05.2024.
//

import UIKit

class RegisterScreenVC: UIViewController {

    @IBOutlet weak var mailDescriptionText: UILabel!
    
    @IBOutlet weak var mailTextField: UITextField!
    
    @IBOutlet weak var checkBoxButton: UIButton!
    
    let checkedImage = UIImage(systemName: "checkmark.square.fill")
    let uncheckedImage = UIImage()
    
    @IBOutlet weak var contractTextLabel: UILabel!
    
    
    @IBOutlet weak var secondView: UIView!
    
    @IBOutlet weak var secondViewLabel: UILabel!
    
    @IBOutlet weak var secondViewButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineSpacing = 10
        
        let mailText = NSAttributedString(string: """
 Bu e-postayı ve parolayı Disney+ hesabınızda oturum
 açarak favori programlarınızı ve filmlerinizi izlemek için
 kullanacaksınız
 """,attributes: [NSAttributedString.Key.paragraphStyle: paragraph])
       
        
        mailDescriptionText.attributedText = mailText
      
        let hexColour = UIColor(named: "#707070")
        
        _ = NSAttributedString(string: " E-posta adresi", attributes: [NSAttributedString.Key.foregroundColor : hexColour  ])
        
        mailTextField.layer.borderColor = UIColor.lightGray.cgColor
        mailTextField.layer.borderWidth = 0.5
        mailTextField.layer.cornerRadius = 3.5
        
       
        checkBoxButton.setImage(uncheckedImage, for: .normal)
        checkBoxButton.setImage(checkedImage, for: .selected)
        checkBoxButton.addTarget(self, action: #selector(checkBoxTapped(_:)), for: .touchUpInside)
        checkBoxButton.layer.borderWidth = 1.2
        checkBoxButton.layer.borderColor = UIColor.gray.cgColor
        checkBoxButton.layer.cornerRadius = 4
        
        
        
        let contractText = """
Evet! Disney+ ve Walt Disney Şirketler Grubu'nun diğer ürün
ve hizmetleri ile ilgili özel teklif ve güncellemeri e-posta
yoluyla almak istiyorum.
"""
        let paragraph2 = NSMutableParagraphStyle()
        paragraph2.lineSpacing = 3
        let url = URL(string: "https://privacy.thewaltdisneycompany.com/tr/tanimlar/#Walt-Disney-Şirketleri")!
        let range = (contractText as NSString).range(of: "Walt Disney Şirketler Grubu")
        let contractTextAttributed = NSMutableAttributedString(string: contractText,attributes: [NSMutableAttributedString.Key.paragraphStyle: paragraph2])
        contractTextAttributed.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range)
        contractTextAttributed.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemBlue, range: range)
        contractTextAttributed.addAttribute(NSAttributedString.Key.link, value: url, range: range) //Çalışmıyor. (arastırılıcak)
        contractTextLabel.isUserInteractionEnabled = true
        contractTextLabel.attributedText = contractTextAttributed
      
        secondViewButton.layer.cornerRadius = 5
        secondView.layer.cornerRadius = 5
        let secondLabelText =
"""
Verilerinizi Gizlilik Politikası metnimizde açıklandığı şekilde
kullanabiliriz. "Kabul Et ve Devam Et"e tıkladığınızda MYDisney
hesabınızla ilgili olarak Disney Kullanım Şartları'nı kabul etmiş ve
Gizlilik Politikası, Tanımlama Bilgileri Politikası ve EMEA Gizlilik
Hakları metinlerimizi okuduğunuzu onaylamış olursunuz.
"""
        let paragraph3 = NSMutableParagraphStyle()
        paragraph3.lineSpacing = 3
        let secondLabelTextAttributed = NSMutableAttributedString(string: secondLabelText, attributes: [NSMutableAttributedString.Key.paragraphStyle: paragraph3])
    
        let secondViewTextRange1 = (secondLabelText as NSString).range(of: "Gizlilik Politikası")
        secondLabelTextAttributed.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: secondViewTextRange1)
        secondLabelTextAttributed.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemBlue, range: secondViewTextRange1)
        
        let secondViewTextRange2 = (secondLabelText as NSString).range(of: "Disney Kullanım Şartları")
        secondLabelTextAttributed.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: secondViewTextRange2)
        secondLabelTextAttributed.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemBlue, range: secondViewTextRange2)
        
        let secondViewTextRange3 = (secondLabelText as NSString).range(of: "Tanımlama Bilgileri Politikası")
        secondLabelTextAttributed.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: secondViewTextRange3)
        secondLabelTextAttributed.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemBlue, range: secondViewTextRange3)
        
        let secondViewTextRange4 = (secondLabelText as NSString).range(of: """
EMEA Gizlilik
Hakları metinlerimizi okuduğunuzu onaylamış olursunuz
"""
    )
        secondLabelTextAttributed.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: secondViewTextRange4)
        secondLabelTextAttributed.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemBlue, range: secondViewTextRange4)
        
        let secondViewTextRange5 = (secondLabelText as NSString).range(of: "Gizlilik Politikası,")
        secondLabelTextAttributed.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: secondViewTextRange5)
        secondLabelTextAttributed.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.systemBlue, range: secondViewTextRange5)
        
        
        
        secondViewLabel.attributedText = secondLabelTextAttributed
        
        secondViewButton.addTarget(self, action: #selector(goPage2), for: .touchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)) //Viewde boşluğa tıkladığımızda klavye kapanması.
               view.addGestureRecognizer(tapGesture)
    }
    
    @objc func checkBoxTapped(_ sender: UIButton){
       sender.isSelected = !sender.isSelected
       
        
    }
    
    @objc func dismissKeyboard() {
           view.endEditing(true)
       }
    
    @objc func goPage2(){
        performSegue(withIdentifier: "registerPage2Segue", sender: nil)
    }
   //back button 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
            backItem.title = " "
            navigationItem.backBarButtonItem = backItem
    }
}
