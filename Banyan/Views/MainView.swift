//
//  MainView.swift
//  Banyan
//
//  Created by 井草俊輔 on 2019/03/29.
//  Copyright © 2019 井草俊輔. All rights reserved.
//

import UIKit

final class MainView : UIView {
    
    @IBOutlet private(set) var _view: UIView! {
        didSet {
            _view.frame = bounds
            _view.isUserInteractionEnabled = false
            addSubview(_view)
            _view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
    }
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
