//
//  PhoenixViewController.swift
//  RvpMobile
//
//  Created by Rameshbhai Patel on 02/02/18.
//  Copyright © 2018 Rameshbhai Patel. All rights reserved.
//

import UIKit

class PhoenixViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var viewBecomeHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var viewBecomeCenterVerticleConstraint: NSLayoutConstraint!
    @IBOutlet weak var viewTitletop : UIView?
    @IBOutlet weak var lblTitletop : UILabel?
    
    @IBOutlet weak var viewRxTitle : UIView?
    @IBOutlet weak var lblRxTitle : UILabel?
    
    @IBOutlet weak var lblMedicationName : UILabel?
    @IBOutlet weak var lblMemeberID : UILabel?
    
    @IBOutlet weak var stackRX : UIStackView?
    @IBOutlet weak var stackRxGroup : UIStackView?
    @IBOutlet weak var lblRxGroupTitle : UILabel?
    @IBOutlet weak var lblRxGroup : UILabel?
    
    @IBOutlet weak var stackRxBIN : UIStackView?
    @IBOutlet weak var lblRxBINTitle : UILabel?
    @IBOutlet weak var lblRxBIN : UILabel?
    
    @IBOutlet weak var stackRxPCN : UIStackView?
    @IBOutlet weak var lblRxPCNTitle : UILabel?
    @IBOutlet weak var lblRxPCN : UILabel?
    
    @IBOutlet weak var stackDependent : UIStackView?
    @IBOutlet weak var lblDependentsTitle : UILabel?
    @IBOutlet weak var tblDependents : UITableView?
    
    @IBOutlet weak var btnPhoenix : UIButton?
    @IBOutlet weak var lblPhonixMsg : UILabel?
    
    @IBOutlet weak var lblBottomMsg : UILabel?
    
    @IBOutlet weak var btnClose : UIButton?
    
    @IBOutlet weak var viewBecomeMember: UIView!
    @IBOutlet weak var viewBecomeMain: UIView!
    
    var arrSideMenu = ["John Doe - Child", "Brock Nolan - Father", "Alvis Presley - Spouse", "Rock - Driver"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblDependents?.estimatedRowHeight = 35
        tblDependents?.rowHeight = UITableViewAutomaticDimension
        self.setFontColorAttribute() // set font and color

        // Do any additional setup after loading the view.
    }
    func setFontColorAttribute() {
        self.viewBecomeHeightConstraint.constant = 370
        self.viewBecomeCenterVerticleConstraint.constant = -10

        viewTitletop?.backgroundColor = Color.lightYellowColor.value
        viewTitletop?.layer.cornerRadius = 10.0
        viewTitletop?.layer.masksToBounds = true
        lblTitletop?.font = CustomFont.font_Quicksand_Regular.of(size: 9)
        lblTitletop?.textColor = Color.secondaryGrayColor.value
        
        viewRxTitle?.backgroundColor = Color.primaryRedColor.value
        lblRxTitle?.font = CustomFont.font_Quicksand_Bold.of(size: 18)
        lblRxTitle?.textColor = Color.lightWhiteColor.value
        
        lblMedicationName?.font = CustomFont.font_Quicksand_Medium.of(size: 16)
        lblMedicationName?.textColor = Color.primaryRedColor.value
        
        lblMemeberID?.font = CustomFont.font_Quicksand_Bold.of(size: 16)
        lblMemeberID?.backgroundColor = Color.primaryGrayColor.value
        lblMemeberID?.textColor = Color.lightWhiteColor.value
        
        stackRX?.addBackground(color: Color.lightGrayColor.value)
        lblRxGroupTitle?.font = CustomFont.font_Quicksand_Medium.of(size: 12)
        lblRxGroupTitle?.textColor = Color.primaryGrayColor.value
        lblRxGroup?.font = CustomFont.font_Quicksand_Medium.of(size: 16)
        lblRxGroup?.textColor = Color.primaryRedColor.value
        
        lblRxBINTitle?.font = CustomFont.font_Quicksand_Medium.of(size: 12)
        lblRxBINTitle?.textColor = Color.primaryGrayColor.value
        lblRxBIN?.font = CustomFont.font_Quicksand_Medium.of(size: 16)
        lblRxBIN?.textColor = Color.primaryRedColor.value
        
        lblRxPCNTitle?.font = CustomFont.font_Quicksand_Medium.of(size: 12)
        lblRxPCNTitle?.textColor = Color.primaryGrayColor.value
        lblRxPCN?.font = CustomFont.font_Quicksand_Medium.of(size: 16)
        lblRxPCN?.textColor = Color.primaryRedColor.value
        
        lblDependentsTitle?.font = CustomFont.font_Quicksand_Medium.of(size: 16)
        lblDependentsTitle?.backgroundColor = Color.lightGrayColor.value
        lblDependentsTitle?.textColor = Color.primaryGrayColor.value
        
        btnPhoenix?.setImage(UIImage(named: "welcome_RxLogo")!, for: UIControlState.normal)
        lblPhonixMsg?.font = CustomFont.font_Quicksand_Regular.of(size: 14)
        lblPhonixMsg?.textColor = Color.secondaryGrayColor.value
        
        lblBottomMsg?.font = CustomFont.font_Quicksand_Regular.of(size: 12)
        lblBottomMsg?.textColor = Color.lightWhiteColor.value
        
        viewBecomeMember.layer.cornerRadius = 6.0
        viewBecomeMember.layer.masksToBounds = true
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.setBackButton()
    }
    // MARK: - cancelBtnAction
    @IBAction func cancelBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        //        self.presentingViewController?.dismiss(animated: false, completion:nil)
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSideMenu.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "sideMenu"
        var cell: SideMenuCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? SideMenuCell
        if cell == nil {
            tableView.register(UINib(nibName: "SideMenuCell", bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? SideMenuCell
        }
        cell.backgroundColor = Color.lightWhiteColor.value
        cell.lblTitleLeadingConstraint.constant = 0
        cell.imgWidthConstraint.constant = 0
        cell.lblMenuTitle.text = arrSideMenu[indexPath.row]
        return cell
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
