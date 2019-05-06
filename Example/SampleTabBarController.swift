//
//  MainTabBarController.swift
//  Banyan
//
//  Created by 井草俊輔 on 2019/03/31.
//  Copyright © 2019 井草俊輔. All rights reserved.
//

import UIKit
import Banyan

final class SampleTabBarController : BanyanViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpVC()
        setUpButton()
    }
    
    func setUpButton() {
        let firstTab = TabButtonView(image: UIImage(named: "tab")!, title: "home",
                                     selectedImage: UIImage(named: "tab2")!)
        let secondTab = TabButtonView(image: UIImage(named: "tab")!, title: "message",
                                      selectedImage: UIImage(named: "tab2")!)
        let thirdTab = TabButtonView(image: UIImage(named: "tab")!, title: "setting",
                                     selectedImage: UIImage(named: "tab2")!)
        let fourthTab = TabButtonView(image: UIImage(named: "tab")!, title: "edit",
                                      selectedImage: UIImage(named: "tab2")!)
//        let firstTab = GradationTabButtonView(image: UIImage(named: "tab")!,
//                                     selectedImage: UIImage(named: "tab2")!)
//        let secondTab = GradationTabButtonView(image: UIImage(named: "tab")!,
//                                      selectedImage: UIImage(named: "tab2")!)
//        let thirdTab = GradationTabButtonView(image: UIImage(named: "tab")!,
//                                     selectedImage: UIImage(named: "tab2")!)
//        let fourthTab = GradationTabButtonView(image: UIImage(named: "tab")!,
//                                      selectedImage: UIImage(named: "tab2")!)
        self.tabButtons = [firstTab, secondTab, thirdTab, fourthTab]
        self.setUpTabBar()
    }
    
    func setUpVC() {
        let firstVC = SampleViewController()
        firstVC.view.backgroundColor = .red
        let secondVC = SampleViewController()
        secondVC.view.backgroundColor = .blue
        let thirdVC = SampleViewController()
        thirdVC.view.backgroundColor = .green
        let fourthVC = SampleViewController()
        fourthVC.view.backgroundColor = .yellow
        self.viewControllers = [firstVC, secondVC, thirdVC, fourthVC]
        self.addSelectedVC()
    }
}
