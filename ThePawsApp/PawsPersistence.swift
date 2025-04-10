//
//  PawsPersistence.swift
//  ThePawsApp
//
//  Created by Andros Slowley on 4/9/25.
//

import Foundation

class PawsPersistence {
    
    let key = "breeds"
    
    func save(breed: DogBreed) {
        var loadedBreeds = load()
        loadedBreeds.append(breed)
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(loadedBreeds) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
    
    func load() -> [DogBreed] {
        let decoder = JSONDecoder()
        if let data = UserDefaults.standard.data(forKey: key), let breeds = try? decoder.decode([DogBreed].self, from: data) {
            return breeds
        }
        return []
    }
}
