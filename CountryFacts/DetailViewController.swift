//
//  DetailViewController.swift
//  CountryFacts
//
//  Created by Andres Marquez on 2022-05-01.
//

import UIKit

class DetailViewController: UIViewController {
    var selectedCountry: String?
    var countryInfo: String?

    @IBOutlet var countryText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = selectedCountry ?? "Country not found"
        
        fetchDetailCountryInfo(for: selectedCountry ?? "")
        
        countryText.text = countryInfo ?? "Info not found"
        
       
    }

    func fetchDetailCountryInfo(for country: String) {
        let detailURLString = countryDetailURL + country
        
        guard let url = URL(string: detailURLString) else {
            print("Bad URL: \(detailURLString)")
            return
        }
        
        if let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            
            if let jsonResults = try? decoder.decode(Result.self, from: data) {
                countryInfo = jsonResults.query.pages.first?.value.extract
            } else {
                print("Failed to load JSON")
                print(detailURLString)
            }
        }
    }

}
