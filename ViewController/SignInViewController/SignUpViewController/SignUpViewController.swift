//
//  SignUpViewController.swift
//  RvpMobile
//
//  Created by Rameshbhai Patel on 28/01/18.
//  Copyright © 2018 Rameshbhai Patel. All rights reserved.
//

import UIKit
import Presentr
class SignUpViewController: UIViewController {
    @IBOutlet weak var imgRxvIcon: UIImageView!
    @IBOutlet weak var lblSignUpTitle: UILabel!

    @IBOutlet weak var scrView: UIScrollView!
    @IBOutlet weak var viewScr: UIView!
    
    @IBOutlet weak var viewMemberId: UIView!
    @IBOutlet weak var imgMemberId: UIImageView!
    @IBOutlet weak var lblMemberId: UILabel!
    @IBOutlet weak var lblMemberDesc: UILabel!
    
    @IBOutlet weak var viewActivationCode: UIView!
    @IBOutlet weak var imgActivationCode: UIImageView!
    @IBOutlet weak var lblActivationCode: UILabel!
    @IBOutlet weak var lblActivationDesc: UILabel!
    
    @IBOutlet weak var viewBecomeYear: UIView!
    @IBOutlet weak var imgBecomeYear: UIImageView!
    @IBOutlet weak var lblBecomeYear: UILabel!
    @IBOutlet weak var lblBecomeYearDesc: UILabel!
    
    @IBOutlet weak var lblAlreadyAccount: UILabel!
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setFontColorAttribute() // set font and color
        self.navigationController?.isNavigationBarHidden = true

        // Do any additional setup after loading the view.
    }
    func setFontColorAttribute() {
        let image = UIImage(named: "Order_Back_White")?.withRenderingMode(.alwaysTemplate)
        btnBack.setImage(image, for: .normal)
        btnBack.tintColor = Color.secondaryGrayColor.value
        
        lblSignUpTitle.font = CustomFont.font_Quicksand_Bold.of(size: 18)
        lblSignUpTitle.textColor = Color.primaryGrayColor.value
        
        viewMemberId.layer.cornerRadius = 8.0
        viewMemberId.layer.masksToBounds = true
        lblMemberId.font = CustomFont.font_Quicksand_Medium.of(size: 15)
        lblMemberId.textColor = Color.primaryGrayColor.value
        lblMemberDesc.font = CustomFont.font_Quicksand_Regular.of(size: 13)
        lblMemberId.adjustsFontSizeToFitWidth = true
        lblMemberDesc.textColor = Color.tertiaryGrayColor.value
        
        viewActivationCode.layer.cornerRadius = 8.0
        viewActivationCode.layer.masksToBounds = true
        lblActivationCode.font = CustomFont.font_Quicksand_Medium.of(size: 15)
        lblActivationCode.textColor = Color.primaryGrayColor.value
        lblActivationDesc.font = CustomFont.font_Quicksand_Regular.of(size: 13)
        lblActivationDesc.adjustsFontSizeToFitWidth = true
        lblActivationDesc.textColor = Color.tertiaryGrayColor.value
        
        viewBecomeYear.layer.cornerRadius = 8.0
        viewBecomeYear.layer.masksToBounds = true
        lblBecomeYear.font = CustomFont.font_Quicksand_Medium.of(size: 15)
        lblBecomeYear.textColor = Color.primaryGrayColor.value
        lblBecomeYearDesc.font = CustomFont.font_Quicksand_Regular.of(size: 13)
        lblBecomeYearDesc.adjustsFontSizeToFitWidth = true
        lblBecomeYearDesc.textColor = Color.tertiaryGrayColor.value
        
        btnSignIn.titleLabel?.textColor = Color.primaryRedColor.value
        btnSignIn.backgroundColor = Color.lightWhiteColor.value
        btnSignIn.titleLabel?.font =  CustomFont.font_Quicksand_Bold.of(size: 18)
        
        lblAlreadyAccount.font = CustomFont.font_Quicksand_Medium.of(size: 14)
        lblAlreadyAccount.textColor = Color.tertiaryGrayColor.value
    }
    
    @IBAction func sendBackAction(_ sender: UIButton) {
        DispatchQueue.main.async {
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func signInBtnAction(_ sender: Any) {
        let objSignIn :SignInViewController  = SignInViewController(nibName:"SignInViewController",bundle:nil)
        self.navigationController?.pushViewController(objSignIn, animated: true)
    }
    
    @IBAction func becomeYearBtnAction(_ sender: Any) {
        let objActivationCode :MemberCodeSignUpVc  = MemberCodeSignUpVc(nibName:"MemberCodeSignUpVc",bundle:nil)
        objActivationCode.modalPresentationStyle = .overCurrentContext
        objActivationCode.isMemberActivationCode = false
        self.customPresentViewController(presenter, viewController: objActivationCode, animated: true, completion: nil)
        /*let objBecomeSignUp :BecomeSignUpViewController  = BecomeSignUpViewController(nibName:"BecomeSignUpViewController",bundle:nil)
        objBecomeSignUp.modalPresentationStyle = .overCurrentContext
        customPresentViewController(presenter, viewController: objBecomeSignUp, animated: true, completion: nil)*/
    }
    
    @IBAction func ActivationCodeBtnAction(_ sender: Any) {
        let objActivationCode :MemberCodeSignUpVc  = MemberCodeSignUpVc(nibName:"MemberCodeSignUpVc",bundle:nil)
        objActivationCode.modalPresentationStyle = .overCurrentContext
        objActivationCode.isMemberActivationCode = true
        customPresentViewController(presenter, viewController: objActivationCode, animated: true, completion: nil)
    }
    
    @IBAction func groupIDBtnAction(_ sender: Any) {
        let objGroup :GroupIdSignUpViewController  = GroupIdSignUpViewController(nibName:"GroupIdSignUpViewController",bundle:nil)
        objGroup.modalPresentationStyle = .overCurrentContext
        customPresentViewController(presenter, viewController: objGroup, animated: true, completion: nil)
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
