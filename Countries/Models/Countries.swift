//
//  Countries.swift
//  Countries
//
//  Created by Hümeyra Şahin on 22.08.2022.
//

import Foundation

struct CountriesResponse: Codable {
    let data: [Country]
}

struct Country: Codable{
    let code: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case code, name
    }
}


