//
//  HomeCollectionViewCell.swift
//  RvpMobile
//
//  Created by Rameshbhai Patel on 03/02/18.
//  Copyright © 2018 Rameshbhai Patel. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var viewCellBG : UIView?
    @IBOutlet weak var lblName : UILabel?
    override func awakeFromNib() {
        viewCellBG?.backgroundColor = Color.lightGrayColor.value
        viewCellBG?.layer.cornerRadius = 15
        
        lblName?.font = CustomFont.font_Quicksand_Regular.of(size: 12)
        lblName?.backgroundColor = .clear
        lblName?.textColor = Color.secondaryGrayColor.value
        super.awakeFromNib()
        // Initialization code
    }
}
