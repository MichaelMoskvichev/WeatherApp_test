//
//  ViewController.swift
//  WeatherApp_test
//
//  Created by Миша Москвичев on 06.10.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func nextVC(_ sender: Any) {
        let storyboard = UIStoryboard(name: "CitiesViewController", bundle: nil)
        guard let citiesVC = storyboard.instantiateViewController(withIdentifier: "CitiesViewController") as? CitiesViewController else { return }

        self.navigationController?.pushViewController(citiesVC, animated: true)
        
    }
    
}

