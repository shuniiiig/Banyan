//
//  TabButtonView.swift
//  Banyan
//
//  Created by 井草俊輔 on 2019/03/25.
//  Copyright © 2019 井草俊輔. All rights reserved.
//

import UIKit

public class TabButtonView : UIControl {
    
    @IBOutlet private(set) var _view: UIView! {
        didSet {
            _view.frame = bounds
            _view.isUserInteractionEnabled = false
            addSubview(_view)
            _view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
    }
    
    @IBOutlet private(set) var baseView: UIView!
    @IBOutlet private(set) var tabImage: UIImageView!
    @IBOutlet private(set) var titleLabel: UILabel!
    @IBOutlet weak var badgeView: UIView!
    @IBOutlet weak var badgeLabel: UILabel!
    private (set) var selectedTabImage: UIImage?
    private (set) var currentTabImage: UIImage?
    
    
    public init(image :UIImage, title :String, selectedImage :UIImage) {
        super.init(frame: .zero)
        UINib(nibName: "TabButtonView", bundle: Bundle(for:
            TabButtonView.self)).instantiate(withOwner: self, options: nil)
        self.tabImage.image = image
        self.titleLabel.text = title
        currentTabImage = image
        selectedTabImage = selectedImage
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func resetImage() {
        if self.isSelected {
            tabImage.image = self.selectedTabImage
        } else {
            tabImage.image = self.currentTabImage
        }
    }
    
}
