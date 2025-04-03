//
//  PawsAPIClient.swift
//  ThePawsApp
//
//  Created by Andros Slowley on 4/2/25.
//
import Foundation

class PawsAPIClient {
    let domain = "https://api.thedogapi.com/"
    let session = URLSession.shared

    func fetchDogBreed(completion: @escaping ([DogBreed]) -> Void) {
        let stringURL = domain + "v1/breeds?limit=50&page=0"
        guard let url = URL(string: stringURL) else { return }
        
        let request = URLRequest(url: url)
        
        let dataTask = session.dataTask(with: request) { data, response, error in
            guard let rawData = data else { return }
            let decoder = JSONDecoder()
            let results = try? decoder.decode([DogBreed].self, from: rawData)
            
            if let finalResults = results {
                completion(finalResults)
            }
            
        }
        
        dataTask.resume()
    }
    
//    func handleResults(data: Data?, response: URLResponse?, error: Error?) {
//        
//    }
}
