//
//  ViewController.swift
//  CountryFacts
//
//  Created by Andres Marquez on 2022-04-30.
//

import UIKit

class ViewController: UITableViewController {
    // Stores the results from wikipedia fetch
    var pages = [Page]()
    // Stores the results from list of countries fetch
    var countries = [Country]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CountryFacts"
        
        fetchCountryList(for: countryListURL)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row].country
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedCountry = countries[indexPath.row].country
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func fetchCountryList(for urlString: String) {
        guard let url = URL(string: urlString) else {
            print("Bad URL: \(urlString)")
            return
        }
        
        if let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()

            if let jsonResults = try? decoder.decode([Country].self, from: data) {
                countries = jsonResults
                tableView.reloadData()
            } else {
                print("Could not decode JSON")
            }
        } else {
            print("Error fetching data")
        }
        print(countries.count)
    }
}

