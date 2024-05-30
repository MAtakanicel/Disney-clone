//
//  RegisterPage2.swift
//  Ios
//
//  Created by Atakan İçel on 10.05.2024.
//

import UIKit

class RegisterPage2: UIViewController {

    @IBOutlet weak var text1: UILabel!
 
    @IBOutlet weak var text2: UILabel!
    
    @IBOutlet weak var text3: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var text4: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineSpacing = 5
        let text1LabelText = NSAttributedString(string: """
DISNEY DTC EM LIMITED (“Disney+”, “biz”, “bizi”,
“bizim”) olarak Disney+ Servisi’ne katılmanızdan büyük
memnuniyet duyuyoruz. “Disney+ Servisi”; Disney+
web sitesini, uygulamasını, ilgili içerikleri ve servisleri
kapsamaktadır.
""",attributes: [NSAttributedString.Key.paragraphStyle: paragraph ])
        text1.attributedText = text1LabelText

        let text2LabelText = NSAttributedString(string: """
DISNEY+ SERVİSİ’Nİ KULLANMADAN ÖNCE
LÜTFEN BU ÜYELİK SÖZLEŞMESİ’Nİ
(“DISNEY+ ÜYELİK SÖZLEŞMESİ” VEYA “SÖZLEŞME”)
DİKKATLİCE OKUYUN.
""",attributes: [NSAttributedString.Key.paragraphStyle: paragraph])
        text2.attributedText = text2LabelText
        
        let text3LabelText = NSAttributedString(string: """
Sözleşme metnini bulamamamız ve Telif Hakları
ilhali nedeni ile sözleşmeyi kendiniz tahmin
etmeniz gerekmektedir.
-Volt Pissney
""",attributes: [NSAttributedString.Key.paragraphStyle: paragraph])
        text3.attributedText = text3LabelText
       
        let paragraph2 = NSMutableParagraphStyle()
        paragraph2.lineSpacing = 3
        let text4LabelText = NSAttributedString(string: """
       "Kabul Et ve Devam Et"e tıkladığınzda Üyelik
            \tSözleşmesi'ni kabul etmiş olursunuz.
""",attributes: [NSAttributedString.Key.paragraphStyle: paragraph2])
        text4.attributedText = text4LabelText
        
        let containerViewTopLine = UIView(frame: CGRectMake(0, 0, containerView.frame.size.width, 0.2))
        containerViewTopLine.backgroundColor = UIColor.gray
        containerView.addSubview(containerViewTopLine)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(buttontapped), for: .touchUpInside)
    }
    
    @objc func buttontapped(){
        performSegue(withIdentifier: "registerPage3Segue", sender: nil)
    }
    //back button
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
            backItem.title = " "
            navigationItem.backBarButtonItem = backItem
    }

   

}
