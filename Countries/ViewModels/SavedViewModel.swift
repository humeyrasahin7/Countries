//
//  SavedViewModel.swift
//  Countries
//
//  Created by Hümeyra Şahin on 22.08.2022.
//

import Foundation

protocol SavedViewModelProtocol{
    var delegate: HomeViewModelDelegate? {get set}
    var numberOfCountries: Int {get}
    func loadCountries()
    func country(index: Int) -> Country?
}


protocol SavedViewModelDelegate: AnyObject{
    func reloadData()
}

final class SavedViewModel {
    
    private var countries: [Country] = []
    weak var delegate: HomeViewModelDelegate?
    
    
    fileprivate func fetchSavedCountries(){
        
    }
    
}

extension SavedViewModel: SavedViewModelProtocol{
    var numberOfCountries: Int {
        countries.count
    }
    
    func loadCountries() {
        fetchSavedCountries()
    }
    
    func country(index: Int) -> Country? {
        countries[index]
    }
    
    
}
