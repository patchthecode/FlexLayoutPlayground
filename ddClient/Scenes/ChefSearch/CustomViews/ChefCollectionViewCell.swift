//
//  ChefCollectionViewCell.swift
//  ScrollableNavigationBar
//
//  Created by tester on 2017-10-13.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit
import FlexLayout

class ChefCollectionViewCell: UICollectionViewCell {
    let padding: CGFloat = 8
    var indexPath: IndexPath?
    
    private let chefView = ChefSummaryView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        rootSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        rootSetup()
    }
    
    func rootSetup() {        
        contentView.flex.paddingTop(padding).define { flex in
            flex.addItem(chefView)
        }
    }
    
    func setup(with data: ViewModel) {
        chefView.setup(with: data)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layout()
    }
    
//    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
//        let val  = super.preferredLayoutAttributesFitting(layoutAttributes)
//        return val
//    }
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        contentView.pin.width(size.width)
        layout()
        return contentView.frame.size
    }
    private func layout() {
    contentView.flex.layout(mode: .adjustHeight)
    }
}
