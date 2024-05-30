//
//  ProfilesScreen.swift
//  Ios
//
//  Created by Atakan İçel on 14.05.2024.
//

import UIKit

class ProfilesScreen: UIViewController {

    
    
    @IBOutlet weak var addbutton: UIButton!
    
    @IBOutlet weak var profileButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addbutton.layer.cornerRadius = addbutton.frame.size.width / 2
         
        profileButton.layer.cornerRadius = profileButton.frame.size.width / 2
        profileButton.addTarget(self, action: #selector(profileSelected), for: .touchUpInside)
        
        }
    @objc func profileSelected(){
        performSegue(withIdentifier: "goMain", sender: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

  
    @objc func dismissKeyboard() {
           view.endEditing(true)
       }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
            backItem.title = " "
            navigationItem.backBarButtonItem = backItem
    }
    
}
