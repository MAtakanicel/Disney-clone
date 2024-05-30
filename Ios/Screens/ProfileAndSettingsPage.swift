//
//  ProfileAndSettingsPage.swift
//  Ios
//
//  Created by Atakan İçel on 16.05.2024.
//

import UIKit

class ProfileAndSettingsPage: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
  
    
    var settings = [
        "İzleme Listem       ",
        "Uygulama Ayarları ",
        "Hesap                 ",
        "Yasal                 ",
        "Yardım                ",
        "Oturumu Kapat       "]
    var selectedSetting : String?

    @IBOutlet weak var profileButton: UIButton!
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileButton.layer.cornerRadius = profileButton.frame.size.width / 2
        
        addButton.layer.cornerRadius = addButton.frame.size.width / 2
        
        button.layer.cornerRadius = 3
        
      
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(named: "#090B18")
        tableView.isUserInteractionEnabled = true
        
        
        button.addTarget(self, action: #selector(profileEditButtonAction), for: .touchUpInside)
        button.layer.cornerRadius = 3
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "\(settings[indexPath.row])"
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
    
    
        
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("seçilen nedir: \(settings[indexPath.row])")
        selectedSetting = settings[indexPath.row]
       // print(selectedSetting)
    }
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }

    @objc func profileEditButtonAction(){
        performSegue(withIdentifier: "profileEdit", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
            backItem.title = " "
            navigationItem.backBarButtonItem = backItem
    }
    
    
}
