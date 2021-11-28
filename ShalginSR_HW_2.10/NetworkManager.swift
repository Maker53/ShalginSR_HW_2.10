//
//  NetworkManager.swift
//  ShalginSR_HW_2.10
//
//  Created by Станислав on 28.11.2021.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let link = "https://dog.ceo/api/breeds/image/random"
    private var randomDog: RandomDog!
    
    func fetchDogImage() {
        guard let url = URL(string: link) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "Empty error description")
                return
            }
            self.parsingJSON(from: data)
        }.resume()
    }
    
    private init() {}
}

extension NetworkManager {
    private func parsingJSON(from data: Data) {
        do {
            self.randomDog = try JSONDecoder().decode(RandomDog.self, from: data)
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
