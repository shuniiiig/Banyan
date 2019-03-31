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
    open private(set) var tabButtons : [TabButtonView]?
    let button = TabButtonView(image: UIImage(named: "tab")!, title: "home",
                               selectedImage: UIImage(named: "tab2")!)
    let button1 = TabButtonView(image: UIImage(named: "tab")!, title: "message",
                                selectedImage: UIImage(named: "tab2")!)
    let button2 = TabButtonView(image: UIImage(named: "tab")!, title: "setting",
                                selectedImage: UIImage(named: "tab2")!)
    let button3 = TabButtonView(image: UIImage(named: "tab")!, title: "edit",
                                selectedImage: UIImage(named: "tab2")!)
    open private(set) var selectedVC: UIViewController?
    var mainView = MainView()
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        tabButtons = [button, button1, button2, button3]
        button.isSelected = true
        button.resetImage()
        stackView.addArrangedSubview(button)
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
        stackView.addArrangedSubview(button3)
        view.addSubview(stackView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.backgroundColor = UIColor.red
        view.addSubview(mainView)
        button.addTarget(self, action: #selector(self.tabEvent(sender:)), for: .touchUpInside)
        button1.addTarget(self, action: #selector(self.tabEvent(sender:)), for: .touchUpInside)
        button2.addTarget(self, action: #selector(self.tabEvent(sender:)), for: .touchUpInside)
        button3.addTarget(self, action: #selector(self.tabEvent(sender:)), for: .touchUpInside)
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @objc func tabEvent(sender: TabButtonView) {
        tabButtons?.forEach ({ button in
            button.isSelected = false
            button.resetImage()
            if button == sender {
                sender.isSelected = true
                sender.resetImage()
                preCurrentIndex = currentIndex
                currentIndex = (tabButtons?.index(of: button))!
                print(currentIndex)
            }
        })
    }
    
//    func addSelectedVC() {
//        selectedVC = viewControllers[currentIndex]
//        addChild(selectedVC!)
//        //selectedVC!.view.frame = mainView.bounds
//        //mainView.addSubview(selectedVC!.view)
//        selectedVC!.didMove(toParentViewController: self)
//    }
//
//    func removePreviousVC() {
//        previousVC = viewControllers[previousIndex]
//        previousVC!.willMove(toParentViewController: nil)
//        previousVC!.view.removeFromSuperview()
//        previousVC!.removeFromParentViewController()
//    }
    
    override open func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        stackView.frame.origin.y = self.view.frame.height - _barHeight
        stackView.frame.size.height = self._barHeight
        stackView.frame.size.width = self.view.frame.size.width
        mainView.topAnchor.constraint(equalTo:self.view.topAnchor, constant: 0.0).isActive = true
        mainView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0.0).isActive = true
        mainView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0.0).isActive = true
        mainView.bottomAnchor.constraint(equalTo: self.stackView.topAnchor, constant: 0.0).isActive = true
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
