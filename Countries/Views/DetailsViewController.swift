//
//  DetailsViewController.swift
//  Countries
//
//  Created by Hümeyra Şahin on 22.08.2022.
//

import UIKit
import SDWebImageSVGCoder


class DetailsViewController: UIViewController {


    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var countryCodeLabel: UILabel!
    @IBOutlet weak var moreInfoButton: UIButton!
    
  
    var wikiID = ""
    var country: Country!
    var isFav: Bool!
    var buttonImage: UIImage!
    private let service = Requests()
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        isFav = isFavorite()
        if isFav{
            buttonImage = UIImage(systemName: "star.fill")
        } else {
            buttonImage = UIImage(systemName: "star")
        }
        title = "\(country.name)"
        
        //let rbItem = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(favTapped))
        
       // navigationController?.navigationBar.topItem?.rightBarButtonItem = rbItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: buttonImage, style: .plain, target: self, action: #selector(favTapped))
        
        setCountryCode(country.code)
        
        service.fetchCountryDetails(code: country.code) { [weak self] countryDetail in
            guard let self = self else {return}
            self.setwikiID(countryDetail.wikiDataID!)
            self.setFlagPicture(countryDetail.flagImageURI!)
        }
        
        let SVGCoder = SDImageSVGCoder.shared
        SDImageCodersManager.shared.addCoder(SVGCoder)
        moreInfoButton.isEnabled = false
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        isFav = isFavorite()
        if isFav{
            buttonImage = UIImage(systemName: "star.fill")
        } else {
            buttonImage = UIImage(systemName: "star")
        }
    }
    

    @IBAction func moreInformationTapped(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "wikiVC") as! WikipediaViewController
        vc.wikiID = wikiID
        navigationController?.pushViewController(vc, animated: true)
    }
    

}

extension DetailsViewController{
    func setCountryCode(_ code: String) {
        countryCodeLabel.text = "Country Code: \(code)"
    }
    
    func setwikiID(_ wiki: String) {
        wikiID = wiki
        moreInfoButton.isEnabled = true
    }
    
    func setFlagPicture(_ flag: String) {
        let url = URL(string: flag)!
        let bitmapSize = CGSize(width: flagImage.frame.width, height: flagImage.frame.height)
        flagImage.sd_setImage(with: url, placeholderImage: nil, options: [], context: [.imageThumbnailPixelSize : bitmapSize])
        
    }
    
    func isFavorite() -> Bool{
        var isFav: Bool!
        
        if StaticCountry.instance.favCountries.contains(country.code){
            isFav = true
        } else {
            isFav = false
        }
        return isFav
    }
   
    @objc func favTapped(){
        if isFav{
            StaticCountry.instance.favCountries.removeAll(where: {$0 == country.code})
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "star")
            //buttonImage = UIImage(systemName: "star")
        } else {
            StaticCountry.instance.favCountries.append(country.code)
            //buttonImage = UIImage(systemName: "star.fill")
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "star.fill")
            StaticCountry.instance.userDefaults.set(StaticCountry.instance.favCountries, forKey: "favs")
            
        }
        StaticCountry.instance.userDefaults.set(StaticCountry.instance.favCountries, forKey: "favs")
        isFav != isFav
    }
    
}


