//
//  ChefCollectionView.swift
//  ddClient
//
//  Created by tester on 2017-10-14.
//  Copyright © 2017 Scarab. All rights reserved.
//

import UIKit

struct ViewModel {
    let p1: URL
    let p2: URL
    let p3: String
    let p4: String
    let p5: String
    let p6: String
    let p7: String
    let p8: String
    let p9: String
    let p10: String
    let p11: String
    
    var fullname: String {
        return "\(p3) \(p4)"
    }
}

protocol ChefCollectionViewAction: class {
    func tappedProfile(for: ViewModel)
    func tappedRestaurant(for: ViewModel)
    func tappedMap(for: ViewModel)
}

class ChefCollectionView: UICollectionView {
    
    let identifier = "chefCell"
    
    var data: [ViewModel] = []
    weak var scrollDelegate: UIScrollViewDelegate?
    weak var actionDelegate: ChefCollectionViewAction?

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        setupCollectionView()
    }

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        self.backgroundColor = .white
        register(ChefCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
        delegate = self
        dataSource = self
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
        }
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        self.pin.topLeft().bottomRight()
//    }
}

extension ChefCollectionView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ChefCollectionViewCell
        cell.indexPath = indexPath
        cell.setup(with: data[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.size.width, height: 452)
//        return UICollectionViewFlowLayoutAutomaticSize
    }
}

// MARK: ScrollView delegates to send to delegate object
extension ChefCollectionView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollDelegate?.scrollViewDidScroll?(scrollView)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        scrollDelegate?.scrollViewWillBeginDragging?(scrollView)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        scrollDelegate?.scrollViewDidEndDragging?(scrollView, willDecelerate: decelerate)
    }
}
