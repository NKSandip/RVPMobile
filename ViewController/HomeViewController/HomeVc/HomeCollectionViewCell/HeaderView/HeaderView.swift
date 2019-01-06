//
//  HeaderView.swift
//  Demo
//
//  Created by suguru-kishimoto on 2017/10/04.
//  Copyright © 2017年 Suguru Kishimoto. All rights reserved.
//

import UIKit
import CHTCollectionViewWaterfallLayout
final class HeaderView: UICollectionReusableView {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var viewHeader: UIView!

    public func configure(with title: String) {
        viewHeader.layer.cornerRadius = 15.0
        viewHeader.layer.masksToBounds = true
        viewHeader.backgroundColor = Color.primaryGrayColor.value        
        titleLabel.font = CustomFont.font_Quicksand_Regular.of(size: 14)
        titleLabel.backgroundColor = .clear
        titleLabel.textColor = Color.lightWhiteColor.value

        titleLabel.text = title
    }
}
