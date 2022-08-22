//
//  HomeViewModel.swift
//  Countries
//
//  Created by Hümeyra Şahin on 22.08.2022.
//

import Foundation

protocol HomeViewModelProtocol{
    var delegate: HomeViewModelDelegate? {get set}
    var numberOfCountries: Int {get}
    func loadCountries()
    func country(index: Int) -> Country?
}


protocol HomeViewModelDelegate: AnyObject{
    func reloadData()
}

final class HomeViewModel {
    
    private var countries: [Country] = []
    weak var delegate: HomeViewModelDelegate?
    private let service = Requests()
    
    fileprivate func fetchCountries(){
        service.fetchCountries(){ result in
            self.countries = result
            self.delegate?.reloadData()
        }
    }
}

extension HomeViewModel: HomeViewModelProtocol{
    var numberOfCountries: Int {
        countries.count
    }
    
    func loadCountries() {
        fetchCountries()
    }
    
    func country(index: Int) -> Country? {
        countries[index]
    }
    
    
}
