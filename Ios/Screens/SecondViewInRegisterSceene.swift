//
//  SecondViewInRegisterSceene.swift
//  Ios
//
//  Created by Atakan İçel on 10.05.2024.
//

import UIKit

class SecondViewInRegisterSceene: UIViewController {
    @IBOutlet weak var secondViewButton: UIButton!
    
    @IBOutlet weak var secondViewTextLabel: UILabel!
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondViewButton.layer.cornerRadius = 5
        
        let secondLabelText =
"""
Verilerinizi Gizlilik Politikası metnimizde açıklandığı şekilde
kullanabiliriz. "Kabul Et ve Devam Et"e tıkladığınızda MYDisney
hesabınızla ilgili olarak Disney Kullanım Şartları'nı kabul etmiş ve
Gizlilik Politikası, Tanımlama Bilgileri Politikası ve EMEA Gizlilik
Hakları metinlerimizi okuduğunuzu onaylamış olursunuz.
"""
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineSpacing = 4
        let secondLabelTextAttributed = NSMutableAttributedString(string: secondLabelText, attributes: [NSMutableAttributedString.Key.paragraphStyle: paragraph])
        
        secondViewTextLabel.attributedText = secondLabelTextAttributed
    }
    



}
