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

