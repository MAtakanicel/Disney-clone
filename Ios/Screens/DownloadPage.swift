//
//  DownloadPage.swift
//  Ios
//
//  Created by Atakan İçel on 16.05.2024.
//

import UIKit

class DownloadPage: UIViewController {

    @IBOutlet weak var TextLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineSpacing = 10
        paragraph.alignment = .center
        let string = """
İndirilmiş İçerik Yok
İndirdiğiniz filmler ve diziler burada
görünecektir.
"""
        let textLabelText = NSMutableAttributedString(string: string
,attributes: [NSAttributedString.Key.paragraphStyle : paragraph])
        let range = (string as NSString ).range(of: "İndirilmiş İçerik Yok")
        let range2 = (string as NSString).range(of:
"""
İndirdiğiniz filmler ve diziler burada
görünecektir.
""")
        textLabelText.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 17) , range: range)
        textLabelText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.lightGray,
                                   range: range2)
        TextLabel.attributedText = textLabelText
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
            backItem.title = " "
            navigationItem.backBarButtonItem = backItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
   

}
