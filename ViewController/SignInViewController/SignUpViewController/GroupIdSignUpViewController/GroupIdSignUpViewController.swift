//
//  GroupIdSignUpViewController.swift
//  RvpMobile
//
//  Created by Rameshbhai Patel on 30/01/18.
//  Copyright © 2018 Rameshbhai Patel. All rights reserved.
//

import UIKit

class GroupIdSignUpViewController: UIViewController {
    @IBOutlet weak var viewBecomeHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var viewMemberGroupIdTitle: UIView!
    @IBOutlet weak var lblMemberGroupIdTitle: UILabel!
    
    @IBOutlet weak var lblMemberId: UILabel!
    @IBOutlet weak var viewMemberId: UIView!
    @IBOutlet weak var txtMemeberId: UITextField!
    
    @IBOutlet weak var lblGroupId: UILabel!
    @IBOutlet weak var viewGroupId: UIView!
    @IBOutlet weak var txtGroupId: UITextField!
    
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnSignIn: UIButton!
    
    @IBOutlet weak var viewBecomeMember: UIView!
    @IBOutlet weak var viewBecomeMain: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setFontColorAttribute() // set font and color
        // Do any additional setup after loading the view.
    }
    func setFontColorAttribute() {
        self.viewBecomeHeightConstraint.constant = 215

        viewMemberGroupIdTitle.backgroundColor = Color.primaryRedColor.value
        UITextField.appearance().tintColor = Color.primaryGrayColor.value
        
        lblMemberGroupIdTitle.font = CustomFont.font_Quicksand_Bold.of(size: 16)
        lblMemberGroupIdTitle.textColor = Color.lightWhiteColor.value
        
        lblMemberId.font = CustomFont.font_Quicksand_Regular.of(size: 12)
        lblMemberId.textColor = Color.primaryRedColor.value
        viewMemberId.backgroundColor = Color.lightGrayColor.value
        viewMemberId.layer.cornerRadius = 4.0
        viewMemberId.layer.masksToBounds = true
        txtMemeberId.font = CustomFont.font_Quicksand_Regular.of(size: 14)
        txtMemeberId.textColor = Color.primaryGrayColor.value

        lblGroupId.font = CustomFont.font_Quicksand_Regular.of(size: 12)
        lblGroupId.textColor = Color.primaryRedColor.value
        viewGroupId.backgroundColor = Color.lightGrayColor.value
        viewGroupId.layer.cornerRadius = 4.0
        viewMemberId.layer.masksToBounds = true
        txtGroupId.font = CustomFont.font_Quicksand_Regular.of(size: 14)
        txtGroupId.textColor = Color.primaryGrayColor.value

        viewBecomeMember.layer.cornerRadius = 12.0
        viewBecomeMember.layer.masksToBounds = true
        
        btnCancel.layer.cornerRadius = 4.0
        btnCancel.layer.masksToBounds = true
        btnCancel.setTitle("CANCEL", for: .normal)
        btnCancel.titleLabel?.textColor = Color.primaryRedColor.value
        btnCancel.backgroundColor = Color.lightGrayColor.value
        btnCancel.titleLabel?.font =  CustomFont.font_Quicksand_Bold.of(size: 18)
        
        btnSignIn.layer.cornerRadius = 4.0
        btnSignIn.layer.masksToBounds = true
        btnSignIn.setTitle("SIGN IN", for: .normal)
        btnSignIn.titleLabel?.textColor = Color.lightWhiteColor.value
        btnSignIn.backgroundColor = Color.primaryRedColor.value
        btnSignIn.titleLabel?.font =  CustomFont.font_Quicksand_Bold.of(size: 18)

    }
    @IBAction func signInBtnAction(_ sender: Any) {
        self.view.endEditing(true)
        if !validateTextFields() {
            return
        }
        self.showAlertViewWithMessageAndActionHandler("Success!", message: NSLocalizedString("Group Id SignUp Successfully Done!!!!.", comment: ""), actionHandler: {
            DispatchQueue.main.async {
                _ = self.navigationController?.popViewController(animated: true)
            }
        })
    }
    func validateTextFields() -> Bool {
        if self.txtMemeberId.text == nil || self.txtMemeberId.text == "" {
            showAlertViewWithMessageAndActionHandler("Error.", message: "Member Id field can not be empty.", actionHandler: {
                self.txtMemeberId.becomeFirstResponder()
            })
            return false
        }
       else if self.txtGroupId.text == nil || self.txtGroupId.text == "" {
            showAlertViewWithMessageAndActionHandler("Error.", message: "Group Id field can not be empty.", actionHandler: {
                self.txtGroupId.becomeFirstResponder()
            })
            return false
        }else {
            return true
        }
    }
    @IBAction func cancelBtnAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
//        self.presentingViewController?.dismiss(animated: false, completion:nil)
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
