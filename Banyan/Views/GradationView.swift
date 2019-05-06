//
//  GradationView.swift
//  Banyan
//
//  Created by 井草俊輔 on 2019/05/06.
//  Copyright © 2019 井草俊輔. All rights reserved.
//

import Foundation

class GradationView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    func setUp() {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        
        let color_1 = UIColor(red: 1.0, green: 0.7, blue: 0.7, alpha: 1.0).cgColor
        let color_2 = UIColor(red: 0.7, green: 1.0, blue: 0.7, alpha: 1.0).cgColor
        let color_3 = UIColor(red: 0.7, green: 0.7, blue: 1.0, alpha: 1.0).cgColor
        gradient.colors = [color_1, color_2, color_3]
        
        let position_1 = NSNumber(value: 0.0 as Float)
        let position_2 = NSNumber(value: 0.5 as Float)
        let position_3 = NSNumber(value: 1.0 as Float)
        
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.locations = [position_1, position_2, position_3]
        
        self.layer.insertSublayer(gradient, at: 0)
    }
}
