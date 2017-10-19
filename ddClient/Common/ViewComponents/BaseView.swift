//
//  BaseView.swift
//  podsInPlayground
//
//  Created by tester on 2017-10-14.
//  Copyright © 2017 Apple Inc. All rights reserved.
//
import UIKit

class BaseView: UIView {
    fileprivate (set) var topLayoutGuide: CGFloat = 0
    fileprivate (set) var bottomLayoutGuide: CGFloat = 0
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = .white
    }
    
    func setLayoutGuides(top: CGFloat, bottom: CGFloat) {
        var didChange = false
        
        if top != topLayoutGuide {
            topLayoutGuide = top
            didChange = true
        }
        
        if bottom != bottomLayoutGuide {
            bottomLayoutGuide = bottom
            didChange = true
        }
        
        if didChange {
            didChangeLayoutGuides()
        }
    }
    
    func didChangeLayoutGuides() {
        setNeedsLayout()
    }
}
