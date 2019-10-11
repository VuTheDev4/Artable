//
//  RoundedViews.swift
//  Artable
//
//  Created by Vu Duong on 10/11/19.
//  Copyright © 2019 Vu Duong. All rights reserved.
//

import UIKit

class Roundedbutton : UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
    }
}

class RoundedShadowView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
        layer.shadowColor = AppColors.Blue.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 3
        
    }
}

class RoundedImageView : UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5
    }
    
}


