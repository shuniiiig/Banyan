//
//  GradationButtonView.swift
//  BanyanVC
//
//  Created by 井草俊輔 on 2019/05/03.
//  Copyright © 2019 井草俊輔. All rights reserved.
//

import UIKit

public class GradationTabButtonView : UIControl {
    
    @IBOutlet private(set) var _view: UIView! {
        didSet {
            _view.frame = bounds
            _view.isUserInteractionEnabled = false
            addSubview(_view)
            _view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
    }
    
    @IBOutlet private(set) var baseView: GradationView!
    @IBOutlet private(set) var tabImage: UIImageView!
    @IBOutlet open weak var badgeView: RoundBadgeView!
    @IBOutlet open weak var badgeLabel: UILabel!
    private (set) var selectedTabImage: UIImage!
    private (set) var currentTabImage: UIImage!
    
    public init(image :UIImage, selectedImage :UIImage) {
        super.init(frame: .zero)
        UINib(nibName: "GradationTabButtonView", bundle: Bundle(for:
            GradationTabButtonView.self)).instantiate(withOwner: self, options: nil)
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



