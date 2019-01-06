//
//  SideMenuRegisterCell.swift
//  RvpMobile
//
//  Created by Rameshbhai Patel on 03/02/18.
//  Copyright © 2018 Rameshbhai Patel. All rights reserved.
//

import UIKit
class SideMenuRegisterCell: UITableViewCell {
    @IBOutlet weak var viewButtons : UIView?
    @IBOutlet weak var btnRegister : UIButton?
    @IBOutlet weak var btnLogin : UIButton?
    
    @IBOutlet weak var viewLabels : UIView?
    @IBOutlet weak var lblUserName : UILabel?
    @IBOutlet weak var lblEmail : UILabel?
    
    @IBOutlet weak var viewImageBG : UIView?
    @IBOutlet weak var imgBG : UIImageView?
    
    @IBOutlet weak var viewLine : UIView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewButtons?.backgroundColor = .clear
        self.btnRegister?.titleLabel?.textColor = Color.lightWhiteColor.value
        self.btnRegister?.backgroundColor = Color.primaryRedColor.value
        self.btnRegister?.titleLabel?.font =  CustomFont.font_Quicksand_Bold.of(size: 14)
        self.btnLogin?.titleLabel?.textColor = Color.lightWhiteColor.value
        self.btnLogin?.backgroundColor = Color.primaryGrayColor.value
        self.btnLogin?.titleLabel?.font =  CustomFont.font_Quicksand_Bold.of(size: 14)
        
        viewLabels?.backgroundColor = .clear
        lblUserName?.font = CustomFont.font_Quicksand_Regular.of(size: 14)
        lblUserName?.textColor = Color.primaryRedColor.value
        lblEmail?.font = CustomFont.font_Quicksand_Regular.of(size: 11)
        lblEmail?.textColor = Color.primaryGrayColor.value

        // Initialization code
    }
    
    @IBAction func createRegisterBtnAction(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("showRegisterNotificationUpdate"), object: nil)
    }
    
    @IBAction func signInBtnAction(_ sender: Any) {
        NotificationCenter.default.post(name: Notification.Name("showLoginNotificationUpdate"), object: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
