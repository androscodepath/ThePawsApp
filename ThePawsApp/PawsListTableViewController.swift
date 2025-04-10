//
//  PawsListTableViewController.swift
//  ThePawsApp
//
//  Created by Andros Slowley on 4/2/25.
//

import UIKit

/*
 [
   {
     "id": 1,
     "name": "Affenpinscher"
   },
   {
     "id": 2,
     "name": "Afghan Hound"
   },
 ]

 */

struct DogBreed: Codable, Hashable {
    let id: Int
    let name: String
}

class PawsListTableViewController: UITableViewController {
    
    var breeds: [DogBreed] = []
    
    var selectedBreed: DogBreed?
    
    let client = PawsAPIClient()

    override func viewDidLoad() {
        super.viewDidLoad()

        client.fetchDogBreed { results in
            DispatchQueue.main.async {
                self.breeds = results
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return breeds.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let breed = breeds[indexPath.row]

        cell.textLabel?.text = breed.name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedBreed = breeds[indexPath.row]
        performSegue(withIdentifier: "showDog", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDog" {
            if let detailVC = segue.destination as? PawsDetailViewController {
                detailVC.currentBreed = selectedBreed
            }
        }
    }

}
