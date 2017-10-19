//
//  ChefSearchViewController.swift
//  ddClient
//
//  Created by tester on 2017-10-15.
//  Copyright (c) 2017 Scarab. All rights reserved.

import UIKit


class ChefSearchViewController: UIViewController {    
    private let chefCollectionView = ChefCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    weak var scrollViewDelegate: UIScrollViewDelegate?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChefCollectionView()
        
    }
    
    func setupChefCollectionView() {
        let inset: CGFloat = 170
        chefCollectionView.contentInset.top = inset
        chefCollectionView.scrollIndicatorInsets.top = inset
        chefCollectionView.scrollDelegate = scrollViewDelegate
        
        
        
        
        var data: [ViewModel] = []
        for _ in 0...100 {
            let aChef = ViewModel(p1: URL(string: "http://www.google.com")!,
                                                  p2: URL(string: "http://www.google.com")!,
                                                  p3: Utility.faker.name.firstName(),
                                                  p4: Utility.faker.name.lastName(),
                                                  p5: String(repeating: String.fontAwesomeIcon(name: .heart), count: 4),
                                                  p6: "closing in 30 mins",
                                                  p7: "\(String.fontAwesomeIcon(name: .commentO)) \(Utility.faker.number.randomInt(min: 1, max: 300))",
                                                  p8: String(repeating: "$", count: Utility.faker.number.randomInt(min: 1, max: 5)),
                                                  p9: Utility.faker.company.name(),
                                                  p10: "\(Utility.faker.number.randomInt(min: 100, max: 200))km \(String.fontAwesomeIcon(name: .mapMarker))",
                                                  p11: "#pictures #album")
            
            data.append(aChef)
        }
        
        chefCollectionView.data = data
        view.addSubview(chefCollectionView)
    }
    
    override func viewDidLayoutSubviews() {
        chefCollectionView.pin.topLeft().bottomRight()
    }
}








