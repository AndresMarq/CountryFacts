//
//  DetailViewController.swift
//  CountryFacts
//
//  Created by Andres Marquez on 2022-05-01.
//

import UIKit

class DetailViewController: UIViewController {
    var selectedCountry: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = selectedCountry ?? "Country not found"
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
