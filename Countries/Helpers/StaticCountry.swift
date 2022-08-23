//
//  StaticCountry.swift
//  Countries
//
//  Created by Hümeyra Şahin on 23.08.2022.
//

import Foundation

class StaticCountry{
    static let instance = StaticCountry()
    let userDefaults = UserDefaults.standard
    var favCountries = [String]()
    var countries: [Country]?
    var country: Country?
    
}
