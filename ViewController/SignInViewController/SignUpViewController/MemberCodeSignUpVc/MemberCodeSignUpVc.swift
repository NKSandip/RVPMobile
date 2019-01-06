//
//  MemberCodeSignUpVc.swift
//  RvpMobile
//
//  Created by Rameshbhai Patel on 31/01/18.
//  Copyright © 2018 Rameshbhai Patel. All rights reserved.
//

import UIKit

class MemberCodeSignUpVc: UIViewController {
    @IBOutlet weak var viewBecomeHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var viewMemberTitle: UIView!
    @IBOutlet weak var lblMemberTitle: UILabel!
    
    @IBOutlet weak var viewGroupId: UIView!
    @IBOutlet weak var txtGroupId: UITextField!
    
    @IBOutlet weak var viewEmailId: UIView!
    @IBOutlet weak var txtEmailId: UITextField!
    
    @IBOutlet weak var viewMobileNumber: UIView!
    @IBOutlet weak var txtMobileNO: UITextField!
    
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var viewConfirmPsw: UIView!
    @IBOutlet weak var txtConfirmPsw: UITextField!
    @IBOutlet weak var btnAboutUs: UIButton!
    @IBOutlet weak var imgAboutUs: UIImageView!
    
    @IBOutlet weak var viewVerify: UIView!
    @IBOutlet weak var lblVerify: UILabel!
    @IBOutlet weak var btnText: UIButton!
    @IBOutlet weak var btnEmail: UIButton!
    
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    
    @IBOutlet weak var viewBecomeMember: UIView!
    @IBOutlet weak var viewBecomeMain: UIView!
    
    public var isMemberActivationCode : Bool!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setFontColorAttribute() // set font and color

        // Do any additional setup after loading the view.
    }
    func setFontColorAttribute() {
        self.viewBecomeHeightConstraint.constant = 420

        viewMemberTitle.backgroundColor = Color.primaryRedColor.value
        UITextField.appearance().tintColor = Color.primaryGrayColor.value
        
        lblMemberTitle.font = CustomFont.font_Quicksand_Bold.of(size: 16)
        lblMemberTitle.textColor = Color.lightWhiteColor.value

        viewGroupId.backgroundColor = Color.lightGrayColor.value
        viewGroupId.layer.cornerRadius = 4.0
        viewGroupId.layer.masksToBounds = true
        txtGroupId.font = CustomFont.font_Quicksand_Regular.of(size: 14)
        txtGroupId.textColor = Color.primaryGrayColor.value
        
        viewEmailId.backgroundColor = Color.lightGrayColor.value
        viewEmailId.layer.cornerRadius = 4.0
        viewEmailId.layer.masksToBounds = true
        txtEmailId.font = CustomFont.font_Quicksand_Regular.of(size: 14)
        txtEmailId.textColor = Color.primaryGrayColor.value
        
        viewMobileNumber.backgroundColor = Color.lightGrayColor.value
        viewMobileNumber.layer.cornerRadius = 4.0
        viewMobileNumber.layer.masksToBounds = true
        txtMobileNO.font = CustomFont.font_Quicksand_Regular.of(size: 14)
        txtMobileNO.textColor = Color.primaryGrayColor.value
        
        viewPassword.backgroundColor = Color.lightGrayColor.value
        viewPassword.layer.cornerRadius = 4.0
        viewPassword.layer.masksToBounds = true
        txtPassword.font = CustomFont.font_Quicksand_Regular.of(size: 14)
        txtPassword.textColor = Color.primaryGrayColor.value
        
        viewEmailId.backgroundColor = Color.lightGrayColor.value
        viewEmailId.layer.cornerRadius = 4.0
        viewEmailId.layer.masksToBounds = true
        txtEmailId.font = CustomFont.font_Quicksand_Regular.of(size: 14)
        txtEmailId.textColor = Color.primaryGrayColor.value
        
        viewConfirmPsw.backgroundColor = Color.lightGrayColor.value
        viewConfirmPsw.layer.cornerRadius = 4.0
        viewConfirmPsw.layer.masksToBounds = true
        txtConfirmPsw.font = CustomFont.font_Quicksand_Regular.of(size: 14)
        txtConfirmPsw.textColor = Color.primaryGrayColor.value
        
        viewBecomeMember.layer.cornerRadius = 12.0
        viewBecomeMember.layer.masksToBounds = true
        
        lblVerify.font = CustomFont.font_Quicksand_Regular.of(size: 14)
        lblVerify.textColor = Color.secondaryGrayColor.value

        btnText.setTitle("TEXT", for: .normal)
        btnText.setImage(UIImage(named:"Sign_SelectedRadio"), for: .normal)
        btnText.titleLabel?.textColor = Color.secondaryGrayColor.value
        btnText.backgroundColor = .clear
        btnText.titleLabel?.font =  CustomFont.font_Quicksand_Regular.of(size: 14)
        
        btnEmail.setTitle("EMAIL", for: .normal)
        btnEmail.setImage(UIImage(named:"Sign_UnSelectedRadio"), for: .normal)
        btnEmail.titleLabel?.textColor = Color.secondaryGrayColor.value
        btnEmail.backgroundColor = .clear
        btnEmail.titleLabel?.font =  CustomFont.font_Quicksand_Regular.of(size: 14)
        
        btnCancel.layer.cornerRadius = 4.0
        btnCancel.layer.masksToBounds = true
        btnCancel.setTitle("CANCEL", for: .normal)
        btnCancel.titleLabel?.textColor = Color.primaryRedColor.value
        btnCancel.backgroundColor = Color.lightGrayColor.value
        btnCancel.titleLabel?.font =  CustomFont.font_Quicksand_Bold.of(size: 18)
        
        btnSignUp.layer.cornerRadius = 4.0
        btnSignUp.layer.masksToBounds = true
        btnSignUp.setTitle("SIGN UP", for: .normal)
        btnSignUp.titleLabel?.textColor = Color.lightWhiteColor.value
        btnSignUp.backgroundColor = Color.primaryRedColor.value
        btnSignUp.titleLabel?.font =  CustomFont.font_Quicksand_Bold.of(size: 18)
        
        self.changeTextfieldNameAttribute()
    }
    func changeTextfieldNameAttribute() {
        if isMemberActivationCode == true{
            lblMemberTitle.text = "Member Actiovation Code"
            txtGroupId.placeholder = "Group ID"
            txtEmailId.placeholder = "Email Address"
            txtMobileNO.placeholder = "Mobile Number"
            txtPassword.placeholder = "Password"
            txtConfirmPsw.placeholder = "Confirm Password"
            txtConfirmPsw.isEnabled = true
            btnAboutUs.isHidden = true
            imgAboutUs.isHidden = true
            
            txtGroupId.keyboardType = UIKeyboardType.numberPad
            txtEmailId.keyboardType = UIKeyboardType.emailAddress
            txtMobileNO.keyboardType = UIKeyboardType.numberPad
            txtPassword.keyboardType = UIKeyboardType.default
            txtConfirmPsw.keyboardType = UIKeyboardType.default

        }else{
            lblMemberTitle.text = "BECOME A MEMBER"
            txtGroupId.placeholder = "Email Address"
            txtEmailId.placeholder = "Mobile Number"
            txtMobileNO.placeholder = "Password"
            txtPassword.placeholder = "Confirm Password"
            txtConfirmPsw.attributedPlaceholder = NSAttributedString(string: "How did you hear about us?",
                                                                   attributes: [NSAttributedStringKey.foregroundColor: Color.secondaryGrayColor.value])

            txtConfirmPsw.isEnabled = false
            btnAboutUs.isHidden = false
            imgAboutUs.isHidden = false
            imgAboutUs.image = UIImage(named: "Home_Arrow")//?.withRenderingMode(.alwaysTemplate)
//            imgAboutUs.tintColor = Color.secondaryGrayColor.value
            btnSignUp.setTitle("PROCEED TO PAY $24.95", for: .normal)

            txtGroupId.keyboardType = UIKeyboardType.emailAddress
            txtEmailId.keyboardType = UIKeyboardType.numberPad
            txtMobileNO.keyboardType = UIKeyboardType.default
            txtPassword.keyboardType = UIKeyboardType.default
            txtConfirmPsw.keyboardType = UIKeyboardType.default
            
        }
    }
    
    @IBAction func signUpBtnAction(_ sender: Any) {
        self.view.endEditing(true)
        if !validateTextFields() {
            return
        }
        self.showAlertViewWithMessageAndActionHandler("Success!", message: NSLocalizedString("SignIn Successfully Done!!!!", comment: ""), actionHandler: {
            DispatchQueue.main.async {
                _ = self.navigationController?.popViewController(animated: true)
            }
        })
    }
    
    func validateTextFields() -> Bool {
        if self.isMemberActivationCode == true{
            if self.txtGroupId.text == nil || self.txtGroupId.text == "" {
                showAlertViewWithMessageAndActionHandler("Error.", message: "Group ID field can not be empty.", actionHandler: {
                    self.txtGroupId.becomeFirstResponder()
                })
                return false
            }else if self.txtEmailId.text == nil || self.txtEmailId.text == "" {
                showAlertViewWithMessageAndActionHandler("Error.", message: "E-mail field can not be empty.", actionHandler: {
                    self.txtEmailId.becomeFirstResponder()
                })
                return false
            }else if !self.txtEmailId.text!.isValidEmail() {
                showAlertViewWithMessageAndActionHandler("Error.", message: NSLocalizedString("Enter valid email", comment: ""), actionHandler: {
                    self.txtEmailId.becomeFirstResponder()
                })
                return false
            }else if self.txtMobileNO.text == nil || self.txtMobileNO.text == "" {
                showAlertViewWithMessageAndActionHandler("Error.", message: "Mobile Number field can not be empty.", actionHandler: {
                    self.txtMobileNO.becomeFirstResponder()
                })
                return false
            }else if self.txtPassword.text == nil || self.txtPassword.text == "" {
                showAlertViewWithMessageAndActionHandler("Error.", message: "Password field can not be empty.", actionHandler: {
                    self.txtPassword.becomeFirstResponder()
                })
                return false
            }else if self.txtConfirmPsw.text == nil || self.txtConfirmPsw.text == "" {
                showAlertViewWithMessageAndActionHandler("Error.", message: "Confirm Password field can not be empty.", actionHandler: {
                    self.txtConfirmPsw.becomeFirstResponder()
                })
                return false
            }else if self.txtPassword.text != self.txtConfirmPsw.text {
                showAlertViewWithMessageAndActionHandler("Error.", message: "Both Password not match.", actionHandler: {
                    self.txtPassword.becomeFirstResponder()
                })
                return false
            }else {
                return true
            }
        }else{
            if self.txtGroupId.text == nil || self.txtGroupId.text == "" {
                showAlertViewWithMessageAndActionHandler("Error.", message: "E-mail field can not be empty.", actionHandler: {
                    self.txtGroupId.becomeFirstResponder()
                })
                return false
            }else if !self.txtGroupId.text!.isValidEmail() {
                showAlertViewWithMessageAndActionHandler("Error.", message: NSLocalizedString("Enter valid email", comment: ""), actionHandler: {
                    self.txtGroupId.becomeFirstResponder()
                })
                return false
            }else if self.txtEmailId.text == nil || self.txtEmailId.text == "" {
                showAlertViewWithMessageAndActionHandler("Error.", message: "Mobile Number field can not be empty.", actionHandler: {
                    self.txtEmailId.becomeFirstResponder()
                })
                return false
            }else if self.txtMobileNO.text == nil || self.txtMobileNO.text == "" {
                showAlertViewWithMessageAndActionHandler("Error.", message: "Password field can not be empty.", actionHandler: {
                    self.txtMobileNO.becomeFirstResponder()
                })
                return false
            }else if self.txtPassword.text == nil || self.txtPassword.text == "" {
                showAlertViewWithMessageAndActionHandler("Error.", message: "Confirm Password field can not be empty.", actionHandler: {
                    self.txtPassword.becomeFirstResponder()
                })
                return false
            }else if self.txtPassword.text != self.txtMobileNO.text {
                showAlertViewWithMessageAndActionHandler("Error.", message: "Both Password not match.", actionHandler: {
                    self.txtPassword.becomeFirstResponder()
                })
                return false
            }else if self.txtConfirmPsw.text == nil || self.txtConfirmPsw.text == "" {
                showAlertViewWithMessageAndActionHandler("Error.", message: "Select About Us", actionHandler: {
                    self.txtConfirmPsw.becomeFirstResponder()
                })
                return false
            }else {
                return true
            }
        }
        
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
