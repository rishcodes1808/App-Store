//
//  ReviewCell.swift
//  AppStore
//
//  Created by Rishabh Raj on 01/07/19.
//  Copyright © 2019 Rishabh Raj. All rights reserved.
//

import UIKit

class ReviewCell : UICollectionViewCell {
    
    let titleLabel = UILabel(text: "Review Title", font: .boldSystemFont(ofSize: 18))
    
    let authorLabel = UILabel(text: "Author", font: .systemFont(ofSize: 16))
    
    let starsLabel = UILabel(text: "Stars", font: .systemFont(ofSize: 14))
    
    let bodyLabel = UILabel(text: "Review body \nReview Body\nReview Body", font: .systemFont(ofSize: 16),numberOfLines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = #colorLiteral(red: 0.9521474242, green: 0.9424777627, blue: 0.9794601798, alpha: 1)
        
        layer.cornerRadius = 16
        clipsToBounds = true
        
        let stackView = VerticalStackView(arrangedSubviews: [
            UIStackView(arrangedSubviews: [
               titleLabel, UIView(), authorLabel ]),
            starsLabel,
            bodyLabel
            ], spacing: 12)
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
