//
//  DetailViewModel.swift
//  Countries
//
//  Created by Hümeyra Şahin on 22.08.2022.
//

import Foundation



protocol DetailViewModelProtocol{
    var delegate: DetailViewModelDelegate? {get set}
    func viewDidLoad()
    func favButtonTapped()
    func setFlag(_ flag: String)
    func setCountryCode(_ code: String)
    func setwikiID(_ wiki: String)

}


protocol DetailViewModelDelegate: AnyObject{
    func favButtonTapped()
    func setFlagPicture(_ flag: String)
    func setCountryCode(_ code: String)
    func setwikiID(_ wiki: String)
}

final class DetailViewModel {
    var code = ""
    var detail: CountryDetailData?
    weak var delegate: DetailViewModelDelegate?
    private let service = Requests()
    
    fileprivate func fetchDetails(code: String){
        service.fetchCountryDetails(code: code){ result in
            self.detail = result
            self.setFlag((self.detail?.flagImageURI)!)
            self.setCountryCode((self.detail?.wikiDataID)!)
            self.setCountryCode(code)
        }
    }
   
}




extension DetailViewModel: DetailViewModelProtocol{
    func setwikiID(_ wiki: String) {
        self.delegate?.setwikiID(wiki)
    }
    
    func setCountryCode(_ code: String) {
        self.delegate?.setCountryCode(code)
    }
    
    func setFlag(_ flag: String) {
        self.delegate?.setFlagPicture(flag)
    }
    

    
    
    
    func favButtonTapped() {
        
    }
    

    func viewDidLoad() {
        fetchDetails(code: code)
        
    }
    
    
}
