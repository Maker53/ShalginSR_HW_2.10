//
//  NetworkManager.swift
//  ShalginSR_HW_2.10
//
//  Created by Станислав on 28.11.2021.
//

import UIKit

class NetworkManager {
    
    private let link = "https://dog.ceo/api/breeds/image/random"
    private var randomDog: RandomDog!
    
    func fetchDogImage() {
        guard let url = URL(string: link) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "Empty error description")
                return
            }
            
            do {
                self.randomDog = try JSONDecoder().decode(RandomDog.self, from: data)
                
            } catch let error {
                print(error.localizedDescription)
            }
            print(self.randomDog.message ?? "Error image link")
        }.resume()
    }
}
