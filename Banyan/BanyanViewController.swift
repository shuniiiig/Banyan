//
//  ViewController.swift
//  Banyan
//
//  Created by 井草俊輔 on 2019/03/24.
//  Copyright © 2019 井草俊輔. All rights reserved.
//

import UIKit

open class BanyanViewController: UIViewController, UIScrollViewDelegate {
    
    open private(set) var viewControllers = [UIViewController]()
    open private(set) var currentIndex = 0
    open private(set) var preCurrentIndex = 0
    open private(set) var stackView = TabBarStackView()
    
    override open func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let button = TabButtonView()
        let button1 = TabButtonView()
        let button2 = TabButtonView()
        let button3 = TabButtonView()
        stackView.addArrangedSubview(button)
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
        stackView.addArrangedSubview(button3)
        stackView.frame.size.width = self.view.frame.size.width
        view.addSubview(stackView)
    }
    
    override open func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        stackView.frame.origin.y = self.view.frame.height - _barHeight
    }
    
    // change bar height
    private var _barHeight: CGFloat = 74
    open var barHeight: CGFloat {
        get {
            if #available(iOS 11.0, *) {
                return _barHeight + view.safeAreaInsets.bottom
            } else {
                return _barHeight
            }
        }
        set {
            _barHeight = newValue
        }
    }
}
