//
//  SearchView.swift
//  ScrollableNavigationBar
//
//  Created by tester on 2017-10-10.
//  Copyright © 2017 Apple Inc. All rights reserved.
//
import UIKit

class SearchView: UIView {
    let magnifyGlass = UILabel()
    let backLabel = UILabel()

    
    var actionHandler: (()->())?
    
    func setup(with text: String, actionHandler: @escaping ()->()) {
        self.backLabel.text = text
        self.actionHandler = actionHandler
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews() {
        addSubview(magnifyGlass)
        addSubview(backLabel)
        
        magnifyGlass.text = String.fontAwesomeIcon(name: .search)
        magnifyGlass.font = UIFont.fontAwesome(ofSize: 25)
        magnifyGlass.textColor = .black
        magnifyGlass.sizeToFit()
        
        // Setup Label
        backLabel.text = "Try \"Rustic potatoes\""
        backLabel.font = .systemFont(ofSize: 17)
        backLabel.textColor = UIColor(colorWithHexValue: 0x908F91)
        backLabel.numberOfLines = 0
        backLabel.sizeToFit()
        
        
        // Setup views
        backgroundColor = UIColor(colorWithHexValue: 0xF9FAFB)
        layer.borderColor = UIColor(colorWithHexValue: 0xb3b3b3).cgColor
        layer.borderWidth = 0.5
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shadowRadius = 3
        layer.shadowOpacity = 0.05
        
        // Setup actions
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.viewTapped))
        self.addGestureRecognizer(gesture)
    }
    
    @objc private func viewTapped() {
        actionHandler?()
    }
    
    override func layoutSubviews() {
        magnifyGlass.pin.top(7).bottom(7).left(15).aspectRatio(1)
        backLabel.pin.right(of: magnifyGlass, aligned: .center).marginLeft(10).right()
    }
}
