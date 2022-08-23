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
    
    let viewModel = DetailViewModel()
    var wikiID = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details"
        viewModel.delegate = self
        viewModel.viewDidLoad()
        let SVGCoder = SDImageSVGCoder.shared
        SDImageCodersManager.shared.addCoder(SVGCoder)
        moreInfoButton.isEnabled = false
    }
    

    @IBAction func moreInformationTapped(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "wikiVC") as! WikipediaViewController
        vc.wikiID = wikiID
        navigationController?.pushViewController(vc, animated: true)
    }
    

}

extension DetailsViewController: DetailViewModelDelegate{
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
        print("vc delegate",url)
        
    }
    
    func favButtonTapped() {
        
    }
    
    
}


