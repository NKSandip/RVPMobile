//
//  DeliveryAddressCell.swift
//  RvpMobile
//
//  Created by Rameshbhai Patel on 17/02/18.
//  Copyright © 2018 Rameshbhai Patel. All rights reserved.
//

import UIKit

class DeliveryAddressCell: UITableViewCell {
    @IBOutlet weak var ViewMain : UIView?
    @IBOutlet weak var ViewTitle : UIView?
    @IBOutlet weak var lblTitle : UILabel?
    @IBOutlet weak var lblName : UILabel?
    @IBOutlet weak var lblDate : UILabel?
    @IBOutlet weak var lblLocation : UILabel?
    @IBOutlet weak var lblArea : UILabel?
    @IBOutlet weak var lblCity : UILabel?
    @IBOutlet weak var lblEmail : UILabel?
    @IBOutlet weak var lblPhone : UILabel?
    override func awakeFromNib() {
        ViewMain?.backgroundColor = Color.lightWhiteColor.value
        ViewMain?.layer.cornerRadius = 12
        ViewMain?.layer.borderWidth = 1
        ViewMain?.layer.masksToBounds = true
        
        ViewTitle?.backgroundColor = Color.primaryRedColor.value
        lblTitle?.font = CustomFont.font_Quicksand_Bold.of(size: 14)
        lblTitle?.textColor = Color.lightWhiteColor.value
        
        lblName?.font = CustomFont.font_Quicksand_Medium.of(size: 14)
        lblName?.textColor = Color.secondaryGrayColor.value
        lblDate?.font = CustomFont.font_Quicksand_Medium.of(size: 12)
        lblDate?.textColor = Color.secondaryGrayColor.value
        
        lblLocation?.font = CustomFont.font_Quicksand_Regular.of(size: 12)
        lblLocation?.textColor = Color.primaryGrayColor.value
        lblArea?.font = CustomFont.font_Quicksand_Regular.of(size: 12)
        lblArea?.textColor = Color.primaryGrayColor.value
        lblCity?.font = CustomFont.font_Quicksand_Regular.of(size: 12)
        lblCity?.textColor = Color.primaryGrayColor.value
        lblEmail?.font = CustomFont.font_Quicksand_Regular.of(size: 12)
        lblEmail?.textColor = Color.primaryGrayColor.value
        lblPhone?.font = CustomFont.font_Quicksand_Regular.of(size: 12)
        lblPhone?.textColor = Color.primaryGrayColor.value
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
