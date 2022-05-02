//
//  Country.swift
//  CountryFacts
//
//  Created by Andres Marquez on 2022-04-30.
//

import Foundation

// List of countries URL
public let countryListURL = "https://gist.githubusercontent.com/AwrasAlazawi/f1ea03a71e32caf7e812e42e493d57ce/raw/8831c7691a49b295e432978d40964dbca9b9f6ac/Countries.json"

// Country specific URL
// https://en.wikipedia.org/w/api.php?action=query&titles=Canada&format=json&formatversion=2

// For github list of countries
struct Country: Codable {
    var country: String
}

// For Wikipedia results
struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
}
