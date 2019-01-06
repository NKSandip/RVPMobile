//
//  SideMenuCell.swift
//  RvpMobile
//
//  Created by Rameshbhai Patel on 01/02/18.
//  Copyright © 2018 Rameshbhai Patel. All rights reserved.
//

import UIKit

class SideMenuCell: UITableViewCell {
    @IBOutlet weak var lblTitleLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var imgWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var lblMenuTitle : UILabel!
    @IBOutlet weak var imgMenu : UIImageView!
    override func awakeFromNib() {
        lblMenuTitle.font = CustomFont.font_Quicksand_Medium.of(size: 14)
        lblMenuTitle.textColor = Color.secondaryGrayColor.value
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
