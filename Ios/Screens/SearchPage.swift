//
//  SearchPage.swift
//  Ios
//
//  Created by Atakan İçel on 16.05.2024.
//

import UIKit

class SearchPage: UIViewController {
    @IBOutlet weak var diziLabel: UILabel!
    
    @IBOutlet weak var movieLabel: UILabel!
    
    @IBOutlet weak var orginalsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let TV = NSTextAttachment()
        TV.image = UIImage(named: "TV")
        let TVSize = CGSize(width: 20, height: 20)
        TV.bounds = CGRect(origin: .zero, size: TVSize)
        let diziText = NSMutableAttributedString()
        let TVString = NSAttributedString(attachment: TV)
        diziText.append(TVString)
        diziText.append(NSAttributedString(string: "\nDizi"))
        
        diziLabel.attributedText = diziText
        
        let movie = NSTextAttachment()
        movie.image = UIImage(named: "movie")
        let movieSize = CGSize(width: 20, height: 20)
        movie.bounds = CGRect(origin: .zero, size: movieSize)
        let movieText = NSMutableAttributedString()
        let movieString = NSAttributedString(attachment: movie)
        movieText.append(movieString)
        movieText.append(NSAttributedString(string: "\nFilmler"))
        
        movieLabel.attributedText = movieText
        
        let originalsImage = NSTextAttachment()
        originalsImage.image = UIImage(named:"star")
        let orginalsImageSize = CGSize(width: 20, height: 20)
        originalsImage.bounds = CGRect(origin: .zero, size: orginalsImageSize)
        let originalsText = NSMutableAttributedString()
        let originalsString = NSAttributedString(attachment: originalsImage)
        originalsText.append(originalsString)
        originalsText.append(NSAttributedString(string: "\nOriginals"))
        orginalsLabel.attributedText = originalsText
        
        
        
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
