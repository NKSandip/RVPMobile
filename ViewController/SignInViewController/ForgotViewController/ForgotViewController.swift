//
//  ForgotViewController.swift
//  RvpMobile
//
//  Created by Rameshbhai Patel on 26/01/18.
//  Copyright © 2018 Rameshbhai Patel. All rights reserved.
//

import UIKit

class ForgotViewController: UIViewController {

    @IBOutlet weak var imgTopBG: UIImageView!
    @IBOutlet weak var imgBottomBG: UIImageView!
    
    @IBOutlet weak var imgRxvIcon: UIImageView!
    @IBOutlet weak var lblForgotTitle: UILabel!

    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var imgEmail: UIImageView!
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var btnSendLink: UIButton!
    
    @IBOutlet weak var btnLogin: UIButton!

    @IBOutlet weak var lblDontAccount: UILabel!
    @IBOutlet weak var btnCreateAccount: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setFontColorAttribute()
        // Do any additional setup after loading the view.
    }

    func setFontColorAttribute() {
        lblForgotTitle.font = CustomFont.font_Quicksand_Medium.of(size: 14)
        lblForgotTitle.textColor = Color.lightWhiteColor.value
        
//        self.viewEmail.backgroundColor = Color.lightGrayColor.value
        self.viewEmail.layer.cornerRadius = 8.0
        self.viewEmail.layer.masksToBounds = true
        
        UITextField.appearance().tintColor = Color.lightWhiteColor.value
        txtEmail.font = CustomFont.font_Quicksand_Medium.of(size: 14)
        txtEmail.textColor = Color.lightWhiteColor.value

        btnSendLink.layer.cornerRadius = 8.0
        btnSendLink.layer.masksToBounds = true
        btnSendLink.titleLabel?.textColor = Color.lightWhiteColor.value
        btnSendLink.backgroundColor = Color.primaryRedColor.value
        btnSendLink.titleLabel?.font =  CustomFont.font_Quicksand_Medium.of(size: 14)
        
        btnLogin.layer.cornerRadius = 8.0
        btnLogin.layer.masksToBounds = true
        btnLogin.titleLabel?.textColor = Color.lightWhiteColor.value
        btnLogin.backgroundColor = UIColor.clear
        btnLogin.titleLabel?.font =  CustomFont.font_Quicksand_Medium.of(size: 14)
        
        lblDontAccount.font = CustomFont.font_Quicksand_Medium.of(size: 12)
        lblDontAccount.textColor = Color.lightWhiteColor.value
        
        btnCreateAccount.layer.cornerRadius = 8.0
        btnCreateAccount.layer.masksToBounds = true
        btnCreateAccount.titleLabel?.textColor = Color.primaryRedColor.value
        btnCreateAccount.backgroundColor = Color.lightWhiteColor.value
        btnCreateAccount.titleLabel?.font =  CustomFont.font_Quicksand_Medium.of(size: 14)
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
        }
        else {
            return true
        }
    }
    
    @IBAction func sendButtonAction(_ sender: UIButton) {
        self.view.endEditing(true)
        if !validateTextFields() {
            return
        }
        self.showAlertViewWithMessageAndActionHandler("Success!", message: NSLocalizedString("An email with the reset password link has been sent to your email id.", comment: ""), actionHandler: {
            DispatchQueue.main.async {
                _ = self.navigationController?.popViewController(animated: true)
            }
        })
    }
    
    @IBAction func sendBackAction(_ sender: UIButton) {
        DispatchQueue.main.async {
            _ = self.navigationController?.popViewController(animated: true)
        }
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
