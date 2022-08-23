//
//  CountryCell.swift
//  Countries
//
//  Created by Hümeyra Şahin on 22.08.2022.
//

import UIKit

class CountryCell: UITableViewCell {

    @IBOutlet weak var addFavButton: UIButton!
    var buttonPressed : (() -> ()) = {}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    @IBAction func addFavTapped(_ sender: Any) {
        buttonPressed()
    }
    
    
}
