//
//  MedicationForCell.swift
//  RvpMobile
//
//  Created by Rameshbhai Patel on 16/02/18.
//  Copyright © 2018 Rameshbhai Patel. All rights reserved.
//

import UIKit

class MedicationForCell: UITableViewCell {
    @IBOutlet weak var imgRadio : UIImageView?
    @IBOutlet weak var lblName : UILabel?
    @IBOutlet weak var lblRelation : UILabel?
    @IBOutlet weak var btnDelete : UIButton?
    @IBOutlet weak var viewLine : UIView?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.lblName?.font = CustomFont.font_Quicksand_Medium.of(size: 14)
        self.lblName?.textColor = Color.secondaryGrayColor.value
        self.lblRelation?.font = CustomFont.font_Quicksand_Regular.of(size: 12)
        self.lblRelation?.textColor = Color.primaryGrayColor.value
        self.viewLine?.backgroundColor = Color.lightGrayColor.value
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
