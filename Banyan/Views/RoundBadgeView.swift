//
//  RoundBadgeView.swift
//  Banyan
//
//  Created by 井草俊輔 on 2019/05/06.
//  Copyright © 2019 井草俊輔. All rights reserved.
//

import UIKit

public class RoundBadgeView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    func setUp() {
        self.layer.cornerRadius = self.frame.size.width / 2.0
        self.clipsToBounds = true
    }
}
