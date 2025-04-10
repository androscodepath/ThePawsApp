//
//  PawsDetailViewController.swift
//  ThePawsApp
//
//  Created by Andros Slowley on 4/9/25.
//

import UIKit

class PawsDetailViewController: UIViewController {

    var currentBreed: DogBreed?
    let storage = PawsPersistence()

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var breedImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        nameLabel.text = currentBreed?.name
        
        let allBreedsIliked = storage.load()
        
        if allBreedsIliked.contains(currentBreed!) {
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    @IBAction func didTapLike(_ sender: Any) {
        storage.save(breed: currentBreed!)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
