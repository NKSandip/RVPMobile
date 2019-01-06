//
//  MedicationRetailCell.swift
//  RvpMobile
//
//  Created by Rameshbhai Patel on 10/02/18.
//  Copyright © 2018 Rameshbhai Patel. All rights reserved.
//

import UIKit
// # 1: here is the protocol for creating the delegation
protocol MedicationRetailDelegate: class {
    func selectDependentAtIndex(medicationCell : MedicationRetailCell, index: NSInteger)
}
class MedicationRetailCell: UITableViewCell {
    @IBOutlet weak var lblRetailTitle : UILabel?
    @IBOutlet weak var viewRetails : UIView?
    
    @IBOutlet weak var lblDrugName : UILabel?
    @IBOutlet weak var lblPrice : UILabel?
    @IBOutlet weak var viewDrug : UIView?
    
    @IBOutlet weak var lblQty : UILabel?
    @IBOutlet weak var btnRemove : UIButton?
    
    @IBOutlet weak var viewDependant:UIView?
    @IBOutlet weak var lblDependant:UILabel?
    @IBOutlet weak var imgDependantArrow:UIImageView?
    @IBOutlet weak var btnDependant:UIButton?
    @IBOutlet weak var viewMain : UIView?
    
    weak var delegate: MedicationRetailDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setFontColorAttribute()
        // Initialization code
    }
    func setFontColorAttribute() {
        self.viewRetails?.layer.cornerRadius = 4
        self.viewRetails?.layer.masksToBounds = true
        self.viewRetails?.backgroundColor = Color.primaryGrayColor.value
        self.lblRetailTitle?.text = "RETAIL"
        self.lblRetailTitle?.font = CustomFont.font_Quicksand_Bold.of(size: 12)
        self.lblRetailTitle?.textColor = Color.lightWhiteColor.value
        
        self.viewDrug?.layer.cornerRadius = 4//(self.viewTitle?.frame.size.height)! / 2
        self.viewDrug?.layer.masksToBounds = true
        self.viewDrug?.backgroundColor = Color.secondaryGrayColor.value
        self.lblDrugName?.font = CustomFont.font_Quicksand_Bold.of(size: 14)
        self.lblDrugName?.textColor = Color.lightWhiteColor.value
        self.lblPrice?.font = CustomFont.font_Quicksand_Bold.of(size: 14)
        self.lblPrice?.textColor = Color.lightWhiteColor.value
        
        self.lblQty?.font = CustomFont.font_Quicksand_Regular.of(size: 12)
        self.lblQty?.textColor = Color.secondaryGrayColor.value
        self.btnRemove?.titleLabel?.textColor = Color.secondaryGrayColor.value
        self.btnRemove?.titleLabel?.font =  CustomFont.font_Quicksand_Regular.of(size: 12)
        
        self.viewDependant?.layer.cornerRadius = 4
        self.viewDependant?.layer.masksToBounds = true
        self.viewDependant?.backgroundColor = Color.lightGrayColor.value
        self.lblDependant?.font = CustomFont.font_Quicksand_Regular.of(size: 14)
        self.lblDependant?.textColor = Color.secondaryGrayColor.value
        
        self.viewMain?.layer.cornerRadius = 4.0
        self.viewMain?.layer.borderWidth = 1.0
        self.viewMain?.layer.masksToBounds = true
        self.viewMain?.backgroundColor = Color.lightWhiteColor.value
    }
    @IBAction func selectDependentBtnAction(_ sender: Any) {
        self.delegate?.selectDependentAtIndex(medicationCell: self, index: (btnDependant?.tag)!)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
