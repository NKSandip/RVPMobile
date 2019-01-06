//
//  BecomeSignUpViewController.swift
//  RvpMobile
//
//  Created by Rameshbhai Patel on 31/01/18.
//  Copyright © 2018 Rameshbhai Patel. All rights reserved.
//

import UIKit

class BecomeSignUpViewController: UIViewController {
    @IBOutlet weak var viewBecomeHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var viewMemberGroupIdTitle: UIView!
    @IBOutlet weak var lblBecomeTitle: UILabel!
    @IBOutlet weak var lblMsg: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnJoinProgram: UIButton!
    
    @IBOutlet weak var viewBecomeMember: UIView!
    @IBOutlet weak var viewBecomeMain: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setFontColorAttribute() // set font and color
        // Do any additional setup after loading the view.
    }
    func setFontColorAttribute() {
        self.viewBecomeHeightConstraint.constant = 180

        viewMemberGroupIdTitle.backgroundColor = Color.primaryRedColor.value

        lblBecomeTitle.text = "Become a Member";
        lblBecomeTitle.font = CustomFont.font_Quicksand_Bold.of(size: 18)
        lblBecomeTitle.textColor = Color.lightWhiteColor.value
        
        lblMsg.font = CustomFont.font_Quicksand_Regular.of(size: 16)
        lblMsg.textColor = Color.primaryGrayColor.value
        
        lblPrice.font = CustomFont.font_Quicksand_Regular.of(size: 16)
        lblPrice.textColor = Color.primaryGrayColor.value
        
        viewBecomeMember.layer.cornerRadius = 12.0
        viewBecomeMember.layer.masksToBounds = true
        
        btnCancel.titleLabel?.textColor = Color.tertiaryGrayColor.value
        btnCancel.backgroundColor = UIColor.clear
        btnCancel.titleLabel?.font =  CustomFont.font_Quicksand_Medium.of(size: 18)
        
        btnJoinProgram.titleLabel?.textColor = Color.primaryRedColor.value
        btnJoinProgram.backgroundColor = UIColor.clear
        btnJoinProgram.titleLabel?.font =  CustomFont.font_Quicksand_Medium.of(size: 18)
    }
    @IBAction func joinProgramBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion:nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            let objActivationCode :MemberCodeSignUpVc  = MemberCodeSignUpVc(nibName:"MemberCodeSignUpVc",bundle:nil)
            objActivationCode.modalPresentationStyle = .overCurrentContext
            objActivationCode.isMemberActivationCode = false
            self.customPresentViewController(presenter, viewController: objActivationCode, animated: true, completion: nil)
        })
    }
    
    @IBAction func cancelBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
