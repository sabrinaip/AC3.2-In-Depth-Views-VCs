//
//  CardView.swift
//  ProgrammaticPlayingCards
//
//  Created by Sabrina Ip on 12/20/16.
//  Copyright © 2016 Sabrina. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    var topLeftLabel: UILabel = UILabel()
    var bottomRightLabel: UILabel = UILabel()
    var middlePicture = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
        
        let viewElements = [topLeftLabel, bottomRightLabel, middlePicture]

        for element in viewElements {
            self.addSubview(element)
            element.translatesAutoresizingMaskIntoConstraints = false
        }
        
        topLeftLabel.text = "Top Left Yo"
        bottomRightLabel.text = "Botttttom"
        middlePicture.backgroundColor = .lightGray
        
        let topLeftContraint: [NSLayoutConstraint] = [
            topLeftLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            topLeftLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8)
        ]
        
        let bottomRightConstraint: [NSLayoutConstraint] = [
            bottomRightLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            bottomRightLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8)
        ]
        
        let middlePictureConstraint: [NSLayoutConstraint] = [
            middlePicture.topAnchor.constraint(equalTo: topLeftLabel.bottomAnchor, constant: 8),
            middlePicture.leftAnchor.constraint(equalTo: topLeftLabel.rightAnchor, constant: 8),
            middlePicture.rightAnchor.constraint(equalTo: bottomRightLabel.leftAnchor, constant: -8),
            middlePicture.bottomAnchor.constraint(equalTo: bottomRightLabel.topAnchor, constant: -8)
        ]

        let allConstraints = [topLeftContraint, bottomRightConstraint, middlePictureConstraint]
        let _ = allConstraints.map { $0.map { $0.isActive = true } }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
