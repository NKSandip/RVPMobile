//
//  SignInViewController.swift
//  RvpMobile
//
//  Created by Rameshbhai Patel on 27/01/18.
//  Copyright © 2018 Rameshbhai Patel. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
    @IBOutlet weak var imgTopBG: UIImageView!
    @IBOutlet weak var imgBottomBG: UIImageView!
    
    @IBOutlet weak var imgRxvIcon: UIImageView!
    @IBOutlet weak var lblSignInTitle: UILabel!
    
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var imgEmail: UIImageView!
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var viewPassword: UIView!
    @IBOutlet weak var imgPassword: UIImageView!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var btnRemember: UIButton!
    @IBOutlet weak var btnSignIn: UIButton!
    
    @IBOutlet weak var btnForgotPsw: UIButton!
    
    @IBOutlet weak var lblDontAccount: UILabel!
    @IBOutlet weak var btnCreateAccount: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setFontColorAttribute() // set font and color
        self.navigationController?.isNavigationBarHidden = true

        // Do any additional setup after loading the view.
    }
    
    func setFontColorAttribute() {
        lblSignInTitle.font = CustomFont.font_Quicksand_Bold.of(size: 18)
        lblSignInTitle.textColor = Color.lightWhiteColor.value
        
        UITextField.appearance().tintColor = Color.lightWhiteColor.value
        self.viewEmail.layer.cornerRadius = 8.0
        self.viewEmail.layer.masksToBounds = true
        txtEmail.font = CustomFont.font_Quicksand_Medium.of(size: 16)
        txtEmail.textColor = Color.lightWhiteColor.value
        
        self.viewPassword.layer.cornerRadius = 8.0
        self.viewPassword.layer.masksToBounds = true
        txtPassword.font = CustomFont.font_Quicksand_Medium.of(size: 16)
        txtPassword.textColor = Color.lightWhiteColor.value
        
        btnSignIn.layer.cornerRadius = 8.0
        btnSignIn.layer.masksToBounds = true
        btnSignIn.titleLabel?.textColor = Color.lightWhiteColor.value
        btnSignIn.backgroundColor = Color.primaryRedColor.value
        btnSignIn.titleLabel?.font =  CustomFont.font_Quicksand_Bold.of(size: 18)
        
        btnForgotPsw.layer.cornerRadius = 8.0
        btnForgotPsw.layer.masksToBounds = true
        btnForgotPsw.titleLabel?.textColor = Color.lightWhiteColor.value
        btnForgotPsw.backgroundColor = UIColor.clear
        btnForgotPsw.titleLabel?.font =  CustomFont.font_Quicksand_Bold.of(size: 16)
        
        lblDontAccount.font = CustomFont.font_Quicksand_Medium.of(size: 14)
        lblDontAccount.textColor = Color.lightWhiteColor.value
        
        btnCreateAccount.layer.cornerRadius = 8.0
        btnCreateAccount.layer.masksToBounds = true
        btnCreateAccount.titleLabel?.textColor = Color.primaryRedColor.value
        btnCreateAccount.backgroundColor = Color.lightWhiteColor.value
        btnCreateAccount.titleLabel?.font =  CustomFont.font_Quicksand_Bold.of(size: 18)
    }
    
    func validateTextFields() -> Bool {
        if self.txtEmail.text == nil || self.txtEmail.text == "" {
            showAlertViewWithMessageAndActionHandler("Error.", message: "E-mail field can not be empty.", actionHandler: {
                self.txtEmail.becomeFirstResponder()
            })
            return false
        }
        else if !self.txtEmail.text!.isValidEmail() {
            showAlertViewWithMessageAndActionHandler("Error.", message: NSLocalizedString("Enter valid email", comment: ""), actionHandler: {
                self.txtEmail.becomeFirstResponder()
            })
            return false
        }else if self.txtPassword.text == nil || self.txtPassword.text == "" {
            showAlertViewWithMessageAndActionHandler("Error.", message: "Password field can not be empty.", actionHandler: {
                self.txtPassword.becomeFirstResponder()
            })
            return false
        }else {
            return true
        }
    }
    
    @IBAction func sendBackAction(_ sender: UIButton) {
        DispatchQueue.main.async {
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func signInBtnAction(_ sender: Any) {
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
    
    @IBAction func signUpBtnAction(_ sender: Any) {
        let objSignUp :SignUpViewController  = SignUpViewController(nibName:"SignUpViewController",bundle:nil)
        self.navigationController?.pushViewController(objSignUp, animated: true)
    }
    @IBAction func forgotBtnAction(_ sender: Any) {
        let objForgotView :ForgotViewController  = ForgotViewController(nibName:"ForgotViewController",bundle:nil)
        self.navigationController?.pushViewController(objForgotView, animated: true)
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
