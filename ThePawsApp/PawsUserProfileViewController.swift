//
//  PawsUserProfileViewController.swift
//  ThePawsApp
//
//  Created by Andros Slowley on 4/2/25.
//

import UIKit

class PawsUserProfileViewController: UIViewController {

    @IBOutlet weak var selfImageView: UIImageView!
    
    @IBOutlet weak var dogImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        selfImageView.layer.cornerRadius = selfImageView.frame.width/2
        
        dogImageView.layer.cornerRadius = dogImageView.frame.width/2
    }
    

}
