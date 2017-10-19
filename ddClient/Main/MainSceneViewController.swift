//
//  MainSceneViewController.swift
//  ddClient
//
//  Created by tester on 2017-10-13.
//  Copyright © 2017 Scarab. All rights reserved.
//

import UIKit
import PinLayout

class MainSceneViewController: UIViewController {
    var modTopCanBeModified = false
    var scrollOffset : CGPoint = CGPoint.zero
    
    @IBOutlet weak var filterButtons: ButtonCollectionView!
    @IBOutlet weak var modTop: NSLayoutConstraint!
    @IBOutlet weak var mainHeaderView: LinedHeaderCollectionView!
    
    let searchView = SearchView()
    let chefSearchVc = ChefSearchViewController()
    
    let maxFadeHeight: CGFloat = 63
    let minFadeHeight: CGFloat = 20
    
    override func viewWillAppear(_ animated: Bool) {
        mainHeaderView.selectItem(at: IndexPath(item: 0, section: 0))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchView.setup(with: "Test", actionHandler: takethis)
        
        filterButtons.setup(with: [
            (text: "Button one", actionHandler: takethis),
            (text: "Button2", actionHandler: takethis),
            (text: "Button 3", actionHandler: takethis)
            ])
        
        mainHeaderView.setup(
            with: [(text: "Tab1", actionHandler: {}),
                   (text: "Tab2", actionHandler: {}),
                   (text: "Tab3", actionHandler: {}),
                   (text: "Tab4", actionHandler: {})
            ]
        )
        
        
        chefSearchVc.scrollViewDelegate = self
        view.insertSubview(chefSearchVc.view, at: 0)
        view.addSubview(searchView)
        
        
        
//        let inset: CGFloat = 170
////        let inset: CGFloat = 132
//        chefCollectionView.contentInset.top = inset
//        chefCollectionView.scrollIndicatorInsets.top = inset
//        
//        chefCollectionView.scrollDelegate = self
    }
    
    func takethis() {
//        print(chefCollectionView.contentInset.top)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        searchView.pin.top(view.safeAreaInsets.top + 7).left(10).right(10).height(44)
        
        chefSearchVc.view.pin
            .top(view.safeAreaInsets.top)
            .bottom(view.safeAreaInsets.bottom)
            .left(view.safeAreaInsets.left + 10)
            .right(view.safeAreaInsets.right + 10)
    }
}

extension MainSceneViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let delta : CGPoint = CGPoint(x: scrollView.contentOffset.x - scrollOffset.x,
                                      y: scrollView.contentOffset.y - scrollOffset.y)
        if scrollView.contentOffset.y < -scrollView.contentInset.top {
            if  modTop.constant < maxFadeHeight {
                UIView.animate(withDuration: 0.2) {
                    self.modTop.constant = self.maxFadeHeight
                    self.updateAlpha()
                }
            }
            return
        }
        
        let x = modTop.constant - delta.y
        if delta.y > 0, modTop.constant > minFadeHeight, modTopCanBeModified {
            modTop.constant = x < minFadeHeight ? minFadeHeight : x
        } else if delta.y < 0, modTop.constant < maxFadeHeight, modTopCanBeModified {
            modTop.constant = x > maxFadeHeight ? maxFadeHeight : x
        }
        updateAlpha()
        scrollOffset = scrollView.contentOffset
    }
    
    func updateAlpha() {
        filterButtons.alpha = (modTop.constant - minFadeHeight) / (maxFadeHeight - minFadeHeight)
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.modTopCanBeModified = true
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        let duration: TimeInterval = 0.2
        if modTop.constant < (maxFadeHeight + minFadeHeight) / 2 {
            self.modTopCanBeModified = false
            UIView.animate(withDuration: duration) {
                self.modTop.constant = self.minFadeHeight
                self.updateAlpha()
                self.view.layoutIfNeeded()
            }
        } else {
            self.modTopCanBeModified = false
            UIView.animate(withDuration: duration) {
                self.modTop.constant = self.maxFadeHeight
                self.updateAlpha()
                self.view.layoutIfNeeded()
            }
        }
    }
}

