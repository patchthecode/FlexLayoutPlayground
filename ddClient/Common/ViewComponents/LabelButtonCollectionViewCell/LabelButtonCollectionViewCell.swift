//
//  LabelButtonCollectionViewCell.swift
//  ScrollableNavigationBar
//
//  Created by tester on 2017-10-12.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit

class LabelButtonCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        label.sizeToFit()
        label.layer.borderWidth = 0.5
        label.layer.cornerRadius = 4
        label.layer.borderColor = UIColor(colorWithHexValue: 0xd2d1d3).cgColor
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 3
        layer.shadowOpacity = 0.05
    }
}
