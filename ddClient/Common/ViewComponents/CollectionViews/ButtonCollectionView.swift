//
//  FilterButtonCollectionView.swift
//  ScrollableNavigationBar
//
//  Created by tester on 2017-10-12.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit

class ButtonCollectionView: XibView {
    @IBOutlet weak var collectionView: UICollectionView!
    let identifier = "buttonCell"
    var buttonDataSource: [(text: String, actionHandler: ()->())] = []
    var buttonPositionStyle: ButtonCollectionViewPositioningStyle = .defaultAligning
    
    enum ButtonCollectionViewPositioningStyle {
        case defaultAligning, equalSpacingPerSectionWith(itemCount: Int)
    }
    
    // MARK: Setup functions
    func setup(with buttonData: [(text: String, actionHandler: ()->())],
               positioningStyle: ButtonCollectionViewPositioningStyle? = nil) {
        self.buttonDataSource = buttonData
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumInteritemSpacing = 7
            layout.scrollDirection = .horizontal
        }
        collectionView.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let nib = UINib(nibName: String(describing: LabelButtonCollectionViewCell.self), bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: identifier)
    }    
}

extension ButtonCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return buttonDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! LabelButtonCollectionViewCell
        cell.label.text = buttonDataSource[indexPath.item].text
        return cell
    }
}


extension ButtonCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let string = buttonDataSource[indexPath.item].text
        var size = string.size(withAttributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 17.0)])
        size.width += 15
        size.height = frame.height - 1 // Minus 1 because sometimes get constraint error when cell height is adjusted by swift to be less than the button height. Constraint conflict ensues
        return size
    }
}
