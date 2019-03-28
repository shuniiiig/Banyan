//
//  TabButtonView.swift
//  Banyan
//
//  Created by 井草俊輔 on 2019/03/25.
//  Copyright © 2019 井草俊輔. All rights reserved.
//

import UIKit

public final class TabButtonView : UIControl {
    
    @IBOutlet private(set) var _view: UIView! {
        didSet {
            _view.frame = bounds
            _view.isUserInteractionEnabled = false
            addSubview(_view)
            _view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
    }
    
    @IBOutlet private(set) var tabImage: UIImageView!
    @IBOutlet private(set) weak var titleLabel: UILabel!
    
    init(image :UIImage, title :String) {
        super.init(frame: .zero)
        UINib(nibName: "TabButtonView", bundle: Bundle(for:
            TabButtonView.self)).instantiate(withOwner: self, options: nil)
        tabImage.image = image
        titleLabel.text = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
