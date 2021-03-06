//
//  ViewController.swift
//  Banyan
//
//  Created by 井草俊輔 on 2019/03/24.
//  Copyright © 2019 井草俊輔. All rights reserved.
//

import UIKit

open class BanyanViewController: UIViewController, UIScrollViewDelegate{
    
    open var viewControllers = [UIViewController]()
    open private(set) var currentIndex = 0
    open private(set) var preCurrentIndex = 0
    open private(set) var stackView = TabBarStackView()
    open var tabButtons : [TabButtonView]?
    open private(set) var selectedVC: UIViewController?
    open private(set) var preCurrentVC: UIViewController?
    var mainView = MainView()
    var defaultColor: UIColor?
    var selectedColor: UIColor?
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(stackView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainView)
    }
    
    override open func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        stackView.frame.origin.y = self.view.frame.size.height - barHeight
        stackView.frame.size.height = self.barHeight
        stackView.frame.size.width = self.view.frame.size.width
        mainView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0.0).isActive = true
        mainView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0.0).isActive = true
        mainView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0.0).isActive = true
        mainView.bottomAnchor.constraint(equalTo: self.stackView.topAnchor, constant: 0.0).isActive = true
    }
    
    override open func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    public func addSelectedVC() {
        selectedVC = viewControllers[currentIndex]
        addChild(selectedVC!)
        selectedVC!.view.frame = mainView.bounds
        mainView.addSubview(selectedVC!.view)
        selectedVC!.didMove(toParent: self)
    }
    
    public func removePreviousVC() {
        preCurrentVC = viewControllers[currentIndex]
        preCurrentVC!.willMove(toParent: nil)
        preCurrentVC!.view.removeFromSuperview()
        preCurrentVC!.removeFromParent()
    }
    
    public func setUpTabBar() {
        tabButtons![currentIndex].isSelected = true
        tabButtons![currentIndex].resetImage()
        tabButtons?.forEach ({ button in
            button.badgeView.isHidden = true
            button.addTarget(self, action: #selector(self.tabEvent(sender:)), for: .touchUpInside)
            stackView.addArrangedSubview(button)
            button.titleLabel.textColor = self.defaultColor
        })
        tabButtons![currentIndex].titleLabel.textColor = self.selectedColor
    }
    
    public func setTextColor(defaultColor :UIColor, selectedColor: UIColor) {
        self.defaultColor = defaultColor
        self.selectedColor = selectedColor
    }
    
    @objc func tabEvent(sender: TabButtonView) {
        removePreviousVC()
        tabButtons?.forEach ({ button in
            button.isSelected = false
            button.titleLabel.textColor = self.defaultColor
            button.resetImage()
            if button == sender {
                sender.isSelected = true
                sender.titleLabel.textColor = self.selectedColor
                sender.resetImage()
                preCurrentIndex = currentIndex
                currentIndex = (tabButtons?.firstIndex(of: button))!
                addSelectedVC()
            }
        })
    }
    
    private var _barHeight: CGFloat = 49
    private var barHeight: CGFloat {
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
