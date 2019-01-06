//
//  BillAddressViewController.swift
//  RvpMobile
//
//  Created by Rameshbhai Patel on 13/02/18.
//  Copyright © 2018 Rameshbhai Patel. All rights reserved.
//

import UIKit

class BillAddressViewController: UIViewController {    
    @IBOutlet weak var scrBill : UIScrollView?
    @IBOutlet weak var viewBillMain : UIView?
    @IBOutlet weak var stackBillMain : UIView?
    
    @IBOutlet weak var lblFirstName : UILabel?
    @IBOutlet weak var viewFirstName : UIView?
    @IBOutlet weak var txtFirstName : UITextField?
    
    @IBOutlet weak var lblLastName : UILabel?
    @IBOutlet weak var viewLastName : UIView?
    @IBOutlet weak var txtLastName : UITextField?
    
    @IBOutlet weak var lblPhoneNo : UILabel?
    @IBOutlet weak var viewPhoneNo : UIView?
    @IBOutlet weak var txtPhoneNo : UITextField?
    
    @IBOutlet weak var lblEmail : UILabel?
    @IBOutlet weak var viewEmail : UIView?
    @IBOutlet weak var txtEmail : UITextField?
    
    @IBOutlet weak var lblDOB : UILabel?
    @IBOutlet weak var viewDOB : UIView?
    @IBOutlet weak var txtDOB : UITextField?
    
    @IBOutlet weak var lblAddress : UILabel?
    @IBOutlet weak var viewAddress : UIView?
    @IBOutlet weak var txtAddress : UITextField?
    
    @IBOutlet weak var lblCity : UILabel?
    @IBOutlet weak var viewCity : UIView?
    @IBOutlet weak var txtCity : UITextField?
    
    @IBOutlet weak var viewState:UIView?
    @IBOutlet weak var lblStateTitle:UILabel?
    @IBOutlet weak var lblState:UILabel?
    @IBOutlet weak var imgStateArrow:UIImageView?
    @IBOutlet weak var btnState:UIButton?
    
    @IBOutlet weak var lblZipCode : UILabel?
    @IBOutlet weak var viewZipCode : UIView?
    @IBOutlet weak var txtZipCode : UITextField?
    
    @IBOutlet weak var btnSave:UIButton?

    override func viewDidLoad() {
//        scrBill?.contentSize = CGSize(width: SCREEN_WIDTH, height: SCREEN_HEIGHT + 500)
        self.setFontColorAttribute()

        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.setBackButton()
    }
    func setFontColorAttribute() {
        self.scrBill?.layer.cornerRadius = 4
        self.scrBill?.layer.masksToBounds = true
        self.viewBillMain?.backgroundColor = Color.lightWhiteColor.value

        self.lblFirstName?.font = CustomFont.font_Quicksand_Medium.of(size: 14)
        self.lblFirstName?.textColor = Color.secondaryGrayColor.value
        self.viewFirstName?.backgroundColor = Color.lightGrayColor.value
        self.viewFirstName?.layer.cornerRadius = 4
        self.viewFirstName?.layer.masksToBounds = true
        self.txtFirstName?.font = CustomFont.font_Quicksand_Regular.of(size: 14)
        self.txtFirstName?.textColor = Color.secondaryGrayColor.value
        
        self.lblLastName?.font = CustomFont.font_Quicksand_Medium.of(size: 14)
        self.lblLastName?.textColor = Color.secondaryGrayColor.value
        self.viewLastName?.backgroundColor = Color.lightGrayColor.value
        self.viewLastName?.layer.cornerRadius = 4
        self.viewLastName?.layer.masksToBounds = true
        self.txtLastName?.font = CustomFont.font_Quicksand_Regular.of(size: 14)
        self.txtLastName?.textColor = Color.secondaryGrayColor.value
        
        self.lblPhoneNo?.font = CustomFont.font_Quicksand_Medium.of(size: 14)
        self.lblPhoneNo?.textColor = Color.secondaryGrayColor.value
        self.viewPhoneNo?.backgroundColor = Color.lightGrayColor.value
        self.viewPhoneNo?.layer.cornerRadius = 4
        self.viewPhoneNo?.layer.masksToBounds = true
        self.txtPhoneNo?.font = CustomFont.font_Quicksand_Regular.of(size: 14)
        self.txtPhoneNo?.textColor = Color.secondaryGrayColor.value
        
        self.lblEmail?.font = CustomFont.font_Quicksand_Medium.of(size: 14)
        self.lblEmail?.textColor = Color.secondaryGrayColor.value
        self.viewEmail?.backgroundColor = Color.lightGrayColor.value
        self.viewEmail?.layer.cornerRadius = 4
        self.viewEmail?.layer.masksToBounds = true
        self.txtEmail?.font = CustomFont.font_Quicksand_Regular.of(size: 14)
        self.txtEmail?.textColor = Color.secondaryGrayColor.value
        
        self.lblDOB?.font = CustomFont.font_Quicksand_Medium.of(size: 14)
        self.lblDOB?.textColor = Color.secondaryGrayColor.value
        self.viewDOB?.backgroundColor = Color.lightGrayColor.value
        self.viewDOB?.layer.cornerRadius = 4
        self.viewDOB?.layer.masksToBounds = true
        self.txtDOB?.font = CustomFont.font_Quicksand_Regular.of(size: 14)
        self.txtDOB?.textColor = Color.secondaryGrayColor.value
        
        self.lblAddress?.font = CustomFont.font_Quicksand_Medium.of(size: 14)
        self.lblAddress?.textColor = Color.secondaryGrayColor.value
        self.viewAddress?.backgroundColor = Color.lightGrayColor.value
        self.viewAddress?.layer.cornerRadius = 4
        self.viewAddress?.layer.masksToBounds = true
        self.txtAddress?.font = CustomFont.font_Quicksand_Regular.of(size: 14)
        self.txtAddress?.textColor = Color.secondaryGrayColor.value
        
        self.lblCity?.font = CustomFont.font_Quicksand_Medium.of(size: 14)
        self.lblCity?.textColor = Color.secondaryGrayColor.value
        self.viewCity?.backgroundColor = Color.lightGrayColor.value
        self.viewCity?.layer.cornerRadius = 4
        self.viewCity?.layer.masksToBounds = true
        self.txtCity?.font = CustomFont.font_Quicksand_Regular.of(size: 14)
        self.txtCity?.textColor = Color.secondaryGrayColor.value
        
        self.viewState?.layer.cornerRadius = 4
        self.viewState?.layer.masksToBounds = true
        self.viewState?.backgroundColor = Color.lightGrayColor.value
        self.lblStateTitle?.font = CustomFont.font_Quicksand_Medium.of(size: 14)
        self.lblStateTitle?.textColor = Color.secondaryGrayColor.value
        self.lblState?.font = CustomFont.font_Quicksand_Regular.of(size: 14)
        self.lblState?.textColor = Color.secondaryGrayColor.value
        
        self.lblZipCode?.font = CustomFont.font_Quicksand_Medium.of(size: 14)
        self.lblZipCode?.textColor = Color.secondaryGrayColor.value
        self.viewZipCode?.backgroundColor = Color.lightGrayColor.value
        self.viewZipCode?.layer.cornerRadius = 4
        self.viewZipCode?.layer.masksToBounds = true
        self.txtZipCode?.font = CustomFont.font_Quicksand_Regular.of(size: 14)
        self.txtZipCode?.textColor = Color.secondaryGrayColor.value
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
