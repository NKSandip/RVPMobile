//
//  WelcomeViewController.swift
//  RvpMobile
//
//  Created by Rameshbhai Patel on 26/01/18.
//  Copyright © 2018 Rameshbhai Patel. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var imgBG: UIImageView!
    
    @IBOutlet weak var viewThanks: UIView!
    @IBOutlet weak var lblThanks: UILabel!
    
    @IBOutlet weak var lblWelCome: UILabel!
    
    @IBOutlet weak var imgTopLogo: UIImageView!
    @IBOutlet weak var lblNewUserTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var imgSearch: UIImageView!
    @IBOutlet weak var lblSearchMedication: UILabel!
    
    @IBOutlet weak var viewRedSearch: UIView!
    @IBOutlet weak var imgRedSearch: UIImageView!
    @IBOutlet weak var lblRedSearchMeds: UILabel!
    
    @IBOutlet weak var lblNewUser: UILabel!
    @IBOutlet weak var btnSingUp: UIButton!
    @IBOutlet weak var lblExistingUser: UILabel!
    @IBOutlet weak var btnSingIn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = UIRectEdge(rawValue: 0)
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.setFontColorAttribute()
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setFontColorAttribute() {
        /* =======================================*/
        /* ==============   viewThanks    ==============*/
        /* =======================================*/
        
        if UIScreen.main.isPhone5 == IS_IPHONE_5{
            self.lblNewUserTopConstraint.constant = 20
        }else{
            self.lblNewUserTopConstraint.constant = 30
        }
        
        self.viewThanks.backgroundColor = Color.primaryRedColor.value
        lblThanks.font = CustomFont.font_Quicksand_Bold.of(size: 18)
        lblThanks.textColor = Color.lightWhiteColor.value
        
        lblWelCome.font = CustomFont.font_Quicksand_Medium.of(size: 16)
        lblWelCome.textColor = Color.secondaryGrayColor.value
        
        lblSearchMedication.font = CustomFont.font_Quicksand_Medium.of(size: 16)
        lblSearchMedication.textColor = Color.primaryGrayColor.value
        
        lblRedSearchMeds.font = CustomFont.font_Quicksand_Medium.of(size: 14)
        lblRedSearchMeds.textColor = Color.secondaryGrayColor.value
        
        viewRedSearch.layer.cornerRadius = 20.0
        viewRedSearch.layer.masksToBounds = true
        
        lblNewUser.font = CustomFont.font_Quicksand_Medium.of(size: 14)
        lblNewUser.textColor = Color.secondaryGrayColor.value
        
        btnSingUp.layer.cornerRadius = 8.0
        btnSingUp.layer.masksToBounds = true
        btnSingUp.titleLabel?.textColor = Color.lightWhiteColor.value
        btnSingUp.backgroundColor = Color.primaryRedColor.value
        btnSingUp.titleLabel?.font =  CustomFont.font_Quicksand_Bold.of(size: 18)

        btnSingIn.titleLabel?.textColor = Color.primaryRedColor.value
        btnSingIn.backgroundColor = Color.lightWhiteColor.value
        btnSingIn.titleLabel?.font =  CustomFont.font_Quicksand_Bold.of(size: 18)
        
        lblExistingUser.font = CustomFont.font_Quicksand_Medium.of(size: 14)
        lblExistingUser.textColor = Color.secondaryGrayColor.value
    }
    
    @IBAction func searchMedsBtnAction(_ sender: Any) {
        let objForgotView :ForgotViewController  = ForgotViewController(nibName:"ForgotViewController",bundle:nil)
        self.navigationController?.pushViewController(objForgotView, animated: true)
    }
    
    @IBAction func signUpBtnAction(_ sender: Any) {
        let objSignUp :SignUpViewController  = SignUpViewController(nibName:"SignUpViewController",bundle:nil)
        self.navigationController?.pushViewController(objSignUp, animated: true)
    }
    
    @IBAction func signInBtnAction(_ sender: Any) {
        let objSignIn :SignInViewController  = SignInViewController(nibName:"SignInViewController",bundle:nil)
        self.navigationController?.pushViewController(objSignIn, animated: true)
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
