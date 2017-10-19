//
//  ToggleLabelCollectionViewCell.swift
//  ScrollableNavigationBar
//
//  Created by tester on 2017-10-13.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit

class ToggleLabelCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    
    var selectedColor: UIColor = UIColor.black
    var deSelectedColor: UIColor = UIColor(colorWithHexValue: 0x999999)
    
    private var tappedStateIsSelected = false {
        didSet {
            label.textColor = tappedStateIsSelected ? selectedColor : deSelectedColor
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
