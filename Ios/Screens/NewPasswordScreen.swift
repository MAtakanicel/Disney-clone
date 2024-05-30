//
//  NewPasswordScreen.swift
//  Ios
//
//  Created by Atakan İçel on 12.05.2024.
//

import UIKit

class NewPasswordScreen: UIViewController {

    @IBOutlet weak var bigTitleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var description2Label: UILabel!
    
    @IBOutlet weak var goButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bigTitleLabel.text = "Yeni parola oluşturun"
        
        let paragraph = NSMutableParagraphStyle() ; paragraph.lineSpacing = 5
        descriptionLabel.attributedText = NSAttributedString(string:
"""
Bu parola, Disney+ hesabınızda oturum açmak için
kullandığınız parolanın yerini alır.
""",attributes: [NSAttributedString.Key.paragraphStyle: paragraph ])
        
        passwordTextField.layer.borderWidth = 0.4
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.cornerRadius = 5
        
        paragraph.lineSpacing = 3
        description2Label.attributedText = NSAttributedString(string: 
        """
        Şu karakterler türlerinden 2 tanesini içeren minimum 6 karakter
        (büyük/küçük harfe duyarlı) kullanın: harfler, rakamlar, özel
        karakterler.
        """,attributes: [NSAttributedString.Key.paragraphStyle : paragraph])
        
        goButton.layer.cornerRadius = 5
        goButton.addTarget(self, action: #selector(go), for: .touchUpInside)
    }
    
    @objc func go(){
        performSegue(withIdentifier: "toProfile", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        let image = UIImage(systemName: "chevron.backward.circle.fill")
            backItem.title = " "
        navigationItem.backBarButtonItem = backItem

    }
    @objc func dismissKeyboard() {
           view.endEditing(true)
       }
    

}
