//
//  TabButtonView.swift
//  Banyan
//
//  Created by 井草俊輔 on 2019/03/25.
//  Copyright © 2019 井草俊輔. All rights reserved.
//

import UIKit

class TabButtonView : UIControl {
    
    var imageView = UIImageView()
    var titleLabel = UILabel()
    var badgeView = UIView()
    var badgeLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureSubviews()
    }
    
    func configureSubviews() {
        imageView.image = UIImage(named: "tab")
        badgeView.backgroundColor = UIColor.green
        titleLabel.text = "aaaaa"
        badgeLabel.text = "1"
        addSubview(imageView)
        addSubview(badgeView)
        addSubview(badgeLabel)
        addSubview(titleLabel)
        imageView.contentMode = .center
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.sizeToFit()
        imageView.center = CGPoint(x: bounds.width/2.0, y: bounds.height/2.0)
//        imageView.frame = CGRect(x: bounds.width/2.0, y: bounds.height/2.0, width: 10.0, height: 10.0)
//        titleLabel.sizeToFit()
//        titleLabel.center = CGPoint(x: bounds.width/2.0, y: bounds.height/2.0)
//        titleLabel.frame = bounds
//        badgeView.frame.size.width = 10
//        badgeView.frame.size.height = 10
//        badgeView.sizeToFit()
//        badgeView.center = CGPoint(x: imageView.bounds.width + 50, y: imageView.bounds.height)
//        badgeLabel.sizeToFit()
//        badgeLabel.center = badgeView.center
    }
}
