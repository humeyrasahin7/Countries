//
//  Requests.swift
//  Countries
//
//  Created by Hümeyra Şahin on 22.08.2022.
//

import Foundation
import Alamofire

private let headers: HTTPHeaders = [
    "X-RapidAPI-Key": "795e97294fmsh26fe1d2658c2554p1d505djsn2828d828d307",
        "X-RapidAPI-Host": "wft-geo-db.p.rapidapi.com"
]

private let baseUrl = "https://wft-geo-db.p.rapidapi.com/v1/geo/countries"



struct Requests {
    
        func fetchCountries(completionHandler: @escaping ([Country]) -> ()){
        var countries = [Country]()
        let url = "\(baseUrl)?limit=10"
        
        AF.request(url, method: .get, headers: headers).responseDecodable(of: CountriesResponse.self) { response in
            guard let response = response.value else { return }
            countries = response.data
            print("****", countries)
            completionHandler(countries)
        }
      /*  NetworkManager.shared.request(URL(string: url)!, headers: headers, decodeToType: CountriesResponse.self, completionHandler: completionHandler)*/
    }

}
