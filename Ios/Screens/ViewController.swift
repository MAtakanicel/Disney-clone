//
//  ViewController.swift
//  Ios
//
//  Created by Atakan İçel on 8.05.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var LoginButtonVariable: UIButton!
    
    @IBOutlet weak var Payment: UILabel!
    
    @IBOutlet weak var FirstScreenTextLabel: UILabel!
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        //Oturum aç button üst çizgi
        let lineView = UIView(frame: CGRectMake(0, 0, LoginButtonVariable.frame.size.width, 0.5))
        lineView.backgroundColor=UIColor.gray
        LoginButtonVariable.addSubview(lineView)
        
        Payment.text = """
₺134,99/ay karşılığında üye olun ya da yıllık üyelik için
sadece ₺1.349,99/yıl ödeyerek %15 tasaruf edin.
"""
        FirstScreenTextLabel.text = """
         Orjinal  içerikleri,  gişe
rekortmeni yapımları ve dizileri
           \t\t\t   izle
"""
        navigationItem.backButtonTitle = "Geri Dön"
        
       // self.navigationController?.isNavigationBarHidden = false  //Navitioncontrolleri sayfada gizler.
    }
    
    @IBAction func LoginButton(_ sender: Any) {
        
        performSegue(withIdentifier: "loginSegue", sender: nil)
    }
    
    @IBAction func registerButton(_ sender: Any) {
        
        performSegue(withIdentifier: "registerSegue", sender: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        let image = UIImage(systemName: "chevron.backward.circle.fill")
            backItem.title = " "
        
           // backItem.image = image
        navigationItem.backBarButtonItem = backItem

    }
    
}

