//
//  CountryDetail.swift
//  Countries
//
//  Created by Hümeyra Şahin on 22.08.2022.
//

import Foundation

struct CountryDetailResponse: Codable{
    let data: CountryDetailData?
}

struct CountryDetailData: Codable{
    let flagImageURI: String?
    let wikiDataID: String?

    enum CodingKeys: String, CodingKey {
        case flagImageURI = "flagImageUri"
        case wikiDataID = "wikiDataId"
    }
}
