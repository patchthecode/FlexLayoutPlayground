//
//  ChefSummaryView.swift
//  podsInPlayground
//
//  Created by tester on 2017-10-14.
//  Copyright © 2017 Apple Inc. All rights reserved.
//
import UIKit
import FontAwesome_swift
import FlexLayout
import PinLayout


class ChefSummaryView: BaseView {
    private let rootFlexContainer = UIView()
    
    private let profileImage   = UIImageView()
    private let fullName       = UILabel()
    private let favorateRating = UILabel()
    private let closingTime    = UILabel()
    private let commentCount   = UILabel()
    private let priceLevel     = UILabel()
    private let mainImage      = UIImageView()
    private let companyName    = UILabel()
    private let distance       = UILabel()
    private let hashTags       = UILabel()
    
    
    override init() {
        super.init()
        rootSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        rootSetup()
    }
    
    func rootSetup() {
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = 65 / 2
        
        setupLabel(label: fullName, text: "", font: .systemFont(ofSize: 18))
        setupLabel(label: favorateRating, text: "",
                   color: UIColor(colorWithHexValue: 0xd87a80),
                   font: UIFont.fontAwesome(ofSize: 15))
        
        setupLabel(label: closingTime, text: "", font: .systemFont(ofSize: 13))
        setupLabel(label: commentCount,
                   text: "",
                   font: UIFont.fontAwesome(ofSize: 13))
        
        setupLabel(label: priceLevel, text: "", font: .systemFont(ofSize: 13))
        
        mainImage.layer.masksToBounds = true
        mainImage.layer.cornerRadius = 14
        mainImage.isUserInteractionEnabled = true
        
        setupLabel(label: companyName, text: "", font: .systemFont(ofSize: 25, weight: .bold))
        companyName.textColor = UIColor(colorWithHexValue: 0x56575b)
        
        setupLabel(label: distance, text: "",
                   color: UIColor(colorWithHexValue: 0xd87a80),
                   font: UIFont.fontAwesome(ofSize: 15))
        setupLabel(label: hashTags, text: "", font: .systemFont(ofSize: 13))
        
        rootFlexContainer.flex.define { flex in
            flex.addItem().direction(.row).define { flex in
                flex.addItem(profileImage).height(65).marginLeft(10).aspectRatio(1)
                flex.addItem().backgroundColor(.green).marginLeft(10).grow(2).justifyContent(.spaceBetween).define { flex in
                    flex.addItem(fullName).backgroundColor(.red)
                    flex.addItem(favorateRating)
                    flex.addItem(closingTime)
                }
                flex.addItem().backgroundColor(.green).shrink(1).paddingHorizontal(5).marginLeft(10).define { flex in
                    flex.addItem(commentCount).backgroundColor(.red).marginBottom(5)
                    flex.addItem(priceLevel).backgroundColor(.red)
                }
            }            
            flex.addItem(mainImage).marginTop(20).aspectRatio(16/9)
            flex.addItem().direction(.row).backgroundColor(.green).marginTop(20).define { flex in
                flex.addItem(companyName).width(80%)
                flex.addItem(distance).width(20%).backgroundColor(.blue)
            }
            flex.addItem(hashTags).marginTop(5)
            flex.addItem().height(1).marginTop(25).backgroundColor(.darkGray)
        }
        
        addSubview(rootFlexContainer)
    }
    
    func setup(with data: ViewModel) {
        profileImage.image = #imageLiteral(resourceName: "puppy")
        profileImage.flex.markDirty()
        
        setupLabel(label: fullName, text: data.fullname, font: .systemFont(ofSize: 18))
        fullName.flex.markDirty()
        
        setupLabel(label: favorateRating, text: data.p5,
                   color: UIColor(colorWithHexValue: 0xd87a80),
                   font: UIFont.fontAwesome(ofSize: 15))
        favorateRating.flex.markDirty()
        
        setupLabel(label: closingTime, text: data.p6, font: .systemFont(ofSize: 13))
        closingTime.flex.markDirty()
        
        setupLabel(label: commentCount,
                   text: data.p7,
                   font: UIFont.fontAwesome(ofSize: 13))
        commentCount.flex.markDirty()
        
        setupLabel(label: priceLevel, text:  data.p8,
                   font: .systemFont(ofSize: 13))
        priceLevel.flex.markDirty()
        
        mainImage.image = #imageLiteral(resourceName: "puppy")
        mainImage.flex.markDirty()
        
        setupLabel(label: companyName, text: data.p9/*"A very long name for the restaurant test"*/, font: .systemFont(ofSize: 25, weight: .bold), numberOfLine: 0)
        companyName.flex.markDirty()
        
        setupLabel(label: distance, text: data.p10,
                   color: UIColor(colorWithHexValue: 0xd87a80),
                   font: UIFont.fontAwesome(ofSize: 15))
        distance.flex.markDirty()
        
        setupLabel(label: hashTags, text: data.p11, font: .systemFont(ofSize: 13))
        hashTags.flex.markDirty()
    }
    
    private func setupLabel(label: UILabel, text: String = "", color: UIColor = .black, font: UIFont = .systemFont(ofSize: 14.0), numberOfLine: Int = 0) {
        label.font = font
        label.textColor = color
        label.text = text
        label.numberOfLines = numberOfLine
    }
    
    override func layoutSubviews() {
        rootFlexContainer.pin.top().bottom().left().right()
        rootFlexContainer.flex.layout(mode: .adjustHeight)
    }
}
