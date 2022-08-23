//
//  Extensions.swift
//  Countries
//
//  Created by Hümeyra Şahin on 23.08.2022.
//

import UIKit

extension UIView{
    public func addSubview(_ subview: UIView, stretchToFit: Bool = false) {
           addSubview(subview)
           if stretchToFit {
               subview.translatesAutoresizingMaskIntoConstraints = false
               leftAnchor.constraint(equalTo: subview.leftAnchor).isActive = true
               rightAnchor.constraint(equalTo: subview.rightAnchor).isActive = true
               topAnchor.constraint(equalTo: subview.topAnchor).isActive = true
               bottomAnchor.constraint(equalTo: subview.bottomAnchor).isActive = true
           }
       }
}

extension UITableViewCell{
    public func configCellView(){
        self.backgroundColor = UIColor.white
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 2
        self.layer.cornerRadius = 6
        self.clipsToBounds = true
    }
}
