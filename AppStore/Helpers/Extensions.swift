//
//  Extensions.swift
//  AppStore
//
//  Created by Rishabh Raj on 24/06/19.
//  Copyright © 2019 Rishabh Raj. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(text: String, font : UIFont, numberOfLines : Int = 1) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.numberOfLines = numberOfLines
    }
    
}

extension UIImageView {
    convenience init(cornerRadius : CGFloat) {
        self.init(image: nil)
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}

extension UIButton {
    convenience init(title : String) {
        self.init(type: .system)
        self.setTitle(title,for: .normal)
    }
}

extension UIStackView {
    convenience init(arrangedSubviews: [UIView],customSpacing : CGFloat = 0) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.spacing = customSpacing
    }
}
