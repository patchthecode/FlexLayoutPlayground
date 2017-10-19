//
//  LinedHeaderCollectionView.swift
//  ScrollableNavigationBar
//
//  Created by tester on 2017-10-12.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit

class LinedHeaderCollectionView: ButtonCollectionView {
    @IBOutlet weak var bottomUnderlineViewContainer: UIScrollView!
    @IBOutlet weak var bottomUnderlineView: UIView!    
    @IBOutlet weak var bottomUnderlineViewLeading: NSLayoutConstraint!
    @IBOutlet weak var bottomUnderlineViewWidth: NSLayoutConstraint!
    
    var selectedCell: UICollectionViewCell?
    
    override func awakeFromNib() {
        setupNibs()
        setupUnderlineView()
    }
    
    func setupNibs() {
        let nib = UINib(nibName: String(describing: ToggleLabelCollectionViewCell.self), bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: identifier)
    }
    func setupUnderlineView() {
        bottomUnderlineView.layer.cornerRadius = bottomUnderlineView.frame.height / 2
    }
}

extension LinedHeaderCollectionView {
    // MARK: Selection functions
    func selectItem(at indexPath: IndexPath) {
        collectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
        collectionView.delegate?.collectionView?(collectionView, didSelectItemAt: indexPath)
    }
    
    // MARK: Overidden functions
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ToggleLabelCollectionViewCell
        cell.label.text = buttonDataSource[indexPath.item].text
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let string = buttonDataSource[indexPath.item].text
        var size = string.size(withAttributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 17.0)])
        size.width += 15
        size.height = frame.height - bottomUnderlineView.frame.height - 1
        return size
    }
}
