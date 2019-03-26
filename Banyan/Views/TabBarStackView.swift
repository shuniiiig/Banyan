//
//  TabBarStackView.swift
//  Banyan
//
//  Created by 井草俊輔 on 2019/03/26.
//  Copyright © 2019 井草俊輔. All rights reserved.
//

import UIKit

open class TabBarStackView : UIStackView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    public required init(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        self.axis = .horizontal
        self.frame = .zero
        self.distribution = .fillEqually
        self.alignment = .center
    }
}
