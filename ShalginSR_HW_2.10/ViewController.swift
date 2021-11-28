//
//  ViewController.swift
//  ShalginSR_HW_2.10
//
//  Created by Станислав on 28.11.2021.
//

import UIKit

class ViewController: UIViewController {

    private let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func getDogButtonPressed() {
        networkManager.fetchDogImage()
    }
    

}

