//
//  DrugDetailViewController.swift
//  RvpMobile
//
//  Created by Rameshbhai Patel on 04/02/18.
//  Copyright © 2018 Rameshbhai Patel. All rights reserved.
//

import UIKit

class DrugDetailViewController: UIViewController {

    @IBOutlet weak var viewDrugTitle : UIView?
    @IBOutlet weak var lblDrugName : UILabel?
    @IBOutlet weak var viewTitle:UIView?
    @IBOutlet weak var lblTitle:UILabel?
    
    @IBOutlet weak var stackDropDownView:UIStackView?
    @IBOutlet weak var viewFrom:UIView?
    @IBOutlet weak var lblFrom:UILabel?
    @IBOutlet weak var imgFromArrow:UIImageView?
    @IBOutlet weak var btnFrom:UIButton?
    
    @IBOutlet weak var viewDosage:UIView?
    @IBOutlet weak var lblDosage:UILabel?
    @IBOutlet weak var imgDosageArrow:UIImageView?
    @IBOutlet weak var btnDosage:UIButton?
    
    @IBOutlet weak var viewQuantity:UIView?
    @IBOutlet weak var lblQuantity:UILabel?
    @IBOutlet weak var imgQuantityArrow:UIImageView?
    @IBOutlet weak var btnQuantity:UIButton?
    
    @IBOutlet weak var viewAddToCart:UIView?
    @IBOutlet weak var viewLocalPharmacyTitle:UIView?
    @IBOutlet weak var lblLocalPharmacyTitle:UILabel?
    @IBOutlet weak var lblLocalPharmacyPrice:UILabel?
    @IBOutlet weak var lblLocalPharmacyDiscount:UILabel?
    @IBOutlet weak var lblLocalPharmacyQty:UILabel?
    @IBOutlet weak var lblLocalPharmacySupplyDay:UILabel?
    @IBOutlet weak var btnLocalPharmacyAddToCart:UIButton?
    @IBOutlet weak var lblNoAvailbleRetailer:UILabel?
    
    @IBOutlet weak var viewHomeDeliveryTitle:UIView?
    @IBOutlet weak var lblHomeDeliveryTitle:UILabel?
    @IBOutlet weak var lblHomeDeliveryPrice:UILabel?
    @IBOutlet weak var lblHomeDeliveryDiscount:UILabel?
    @IBOutlet weak var lblHomeDeliveryQty:UILabel?
    @IBOutlet weak var lblHomeDeliverySupplyDay:UILabel?
    @IBOutlet weak var btnHomeDeliveryAddToCart:UIButton?
    @IBOutlet weak var lblNoAvailbleDelivery:UILabel?
    
    @IBOutlet weak var viewOR:UIView?
    @IBOutlet weak var lblOR:UILabel?
    @IBOutlet weak var viewOR_Left:UIView?
    @IBOutlet weak var viewOR_Right:UIView?
    
    @IBOutlet weak var viewPurchase:UIView?
    @IBOutlet weak var lblPurchaseTitle:UILabel?
    @IBOutlet weak var btnTabletOnly:UIButton?
    @IBOutlet weak var lblTabletDeliveryNotes:UILabel?
    @IBOutlet weak var lblHomeDeliveryAddToCart:UIButton?

    @IBOutlet weak var btnSearch:UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setFontColorAttribute()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.setBackButton()
        self.navigationController?.isNavigationBarHidden=false
    }
    
    func setFontColorAttribute() {
        self.viewDrugTitle?.backgroundColor = Color.lightGrayColor.value
        self.lblDrugName?.font = CustomFont.font_Quicksand_Light.of(size: 14)
        self.lblDrugName?.textColor = Color.secondaryGrayColor.value
        
        self.viewTitle?.layer.cornerRadius = 4//(self.viewTitle?.frame.size.height)! / 2
        self.viewTitle?.layer.masksToBounds = true
        self.viewTitle?.backgroundColor = Color.lightYellowColor.value
        self.lblTitle?.font = CustomFont.font_Quicksand_Regular.of(size: 9)
        self.lblTitle?.textColor = Color.secondaryGrayColor.value
        
        self.viewFrom?.layer.cornerRadius = 4.0
        self.viewFrom?.layer.masksToBounds = true
        self.viewFrom?.backgroundColor = Color.lightGrayColor.value
        self.lblFrom?.font = CustomFont.font_Quicksand_Regular.of(size: 14)
        self.lblFrom?.textColor = Color.secondaryGrayColor.value

        self.viewDosage?.layer.cornerRadius = 4.0
        self.viewDosage?.layer.masksToBounds = true
        self.viewDosage?.backgroundColor = Color.lightGrayColor.value
        self.lblDosage?.font = CustomFont.font_Quicksand_Regular.of(size: 14)
        self.lblDosage?.textColor = Color.secondaryGrayColor.value
        
        self.viewQuantity?.layer.cornerRadius = 4.0
        self.viewQuantity?.layer.masksToBounds = true
        self.viewQuantity?.backgroundColor = Color.lightGrayColor.value
        self.lblQuantity?.font = CustomFont.font_Quicksand_Regular.of(size: 14)
        self.lblQuantity?.textColor = Color.secondaryGrayColor.value
        
        self.viewLocalPharmacyTitle?.layer.cornerRadius = (self.viewLocalPharmacyTitle?.frame.size.height)! / 2
        self.viewLocalPharmacyTitle?.layer.masksToBounds = true
        self.viewLocalPharmacyTitle?.backgroundColor = Color.primaryGrayColor.value
        self.lblLocalPharmacyTitle?.font = CustomFont.font_Quicksand_Regular.of(size: 12)
        self.lblLocalPharmacyTitle?.textColor = Color.lightWhiteColor.value
        self.lblLocalPharmacyPrice?.font = CustomFont.font_Quicksand_Bold.of(size: 20)
        self.lblLocalPharmacyPrice?.textColor = Color.secondaryGrayColor.value
        self.lblLocalPharmacyDiscount?.font = CustomFont.font_Quicksand_Regular.of(size: 12)
        self.lblLocalPharmacyDiscount?.textColor = Color.secondaryGrayColor.value
        self.lblLocalPharmacyQty?.font = CustomFont.font_Quicksand_Regular.of(size: 12)
        self.lblLocalPharmacyQty?.textColor = Color.secondaryGrayColor.value
        self.lblLocalPharmacySupplyDay?.font = CustomFont.font_Quicksand_Regular.of(size: 12)
        self.lblLocalPharmacySupplyDay?.textColor = Color.secondaryGrayColor.value
        self.lblNoAvailbleRetailer?.font = CustomFont.font_Quicksand_Regular.of(size: 14)
        self.lblNoAvailbleRetailer?.textColor = Color.secondaryGrayColor.value
        self.btnLocalPharmacyAddToCart?.layer.cornerRadius = 4.0
        self.btnLocalPharmacyAddToCart?.layer.masksToBounds = true
        self.btnLocalPharmacyAddToCart?.titleLabel?.textColor = Color.lightWhiteColor.value
        self.btnLocalPharmacyAddToCart?.backgroundColor = Color.primaryGrayColor.value
        self.btnLocalPharmacyAddToCart?.titleLabel?.font =  CustomFont.font_Quicksand_Medium.of(size: 12)
        
        self.viewHomeDeliveryTitle?.layer.cornerRadius = (self.viewLocalPharmacyTitle?.frame.size.height)! / 2
        self.viewHomeDeliveryTitle?.layer.masksToBounds = true
        self.viewHomeDeliveryTitle?.backgroundColor = Color.primaryRedColor.value
        self.lblHomeDeliveryTitle?.font = CustomFont.font_Quicksand_Regular.of(size: 12)
        self.lblHomeDeliveryTitle?.textColor = Color.lightWhiteColor.value
        self.lblHomeDeliveryPrice?.font = CustomFont.font_Quicksand_Bold.of(size: 20)
        self.lblHomeDeliveryPrice?.textColor = Color.secondaryGrayColor.value
        self.lblHomeDeliveryDiscount?.font = CustomFont.font_Quicksand_Regular.of(size: 12)
        self.lblHomeDeliveryDiscount?.textColor = Color.secondaryGrayColor.value
        self.lblHomeDeliveryQty?.font = CustomFont.font_Quicksand_Regular.of(size: 12)
        self.lblHomeDeliveryQty?.textColor = Color.secondaryGrayColor.value
        self.lblHomeDeliverySupplyDay?.font = CustomFont.font_Quicksand_Regular.of(size: 12)
        self.lblHomeDeliverySupplyDay?.textColor = Color.secondaryGrayColor.value
        self.lblNoAvailbleDelivery?.font = CustomFont.font_Quicksand_Regular.of(size: 14)
        self.lblNoAvailbleDelivery?.textColor = Color.secondaryGrayColor.value
        self.btnHomeDeliveryAddToCart?.layer.cornerRadius = 4.0
        self.btnHomeDeliveryAddToCart?.layer.masksToBounds = true
        self.btnHomeDeliveryAddToCart?.titleLabel?.textColor = Color.lightWhiteColor.value
        self.btnHomeDeliveryAddToCart?.backgroundColor = Color.primaryRedColor.value
        self.btnHomeDeliveryAddToCart?.titleLabel?.font =  CustomFont.font_Quicksand_Medium.of(size: 12)
        
        self.lblOR?.font = CustomFont.font_Quicksand_Regular.of(size: 14)
        self.lblOR?.textColor = Color.secondaryGrayColor.value
        
        self.viewPurchase?.layer.cornerRadius = (self.viewPurchase?.frame.size.height)! / 2
        self.viewPurchase?.layer.masksToBounds = true
        self.viewPurchase?.backgroundColor = Color.lightGrayColor.value

        self.lblPurchaseTitle?.font = CustomFont.font_Quicksand_Regular.of(size: 11)
        self.lblPurchaseTitle?.textColor = Color.secondaryGrayColor.value
        self.btnTabletOnly?.titleLabel?.textColor = Color.primaryRedColor.value
        self.btnTabletOnly?.titleLabel?.font =  CustomFont.font_Quicksand_Regular.of(size: 14)
        self.lblTabletDeliveryNotes?.font = CustomFont.font_Quicksand_Regular.of(size: 14)
        self.lblTabletDeliveryNotes?.textColor = Color.primaryGrayColor.value
        
        let image = UIImage(named: "Home_Search")?.withRenderingMode(.alwaysTemplate)
        self.btnSearch?.setImage(image, for: .normal)
        self.btnSearch?.tintColor = Color.primaryRedColor.value
        self.btnSearch?.titleLabel?.textColor = Color.primaryRedColor.value
        self.btnSearch?.backgroundColor = Color.lightGrayColor.value
        self.btnSearch?.titleLabel?.font =  CustomFont.font_Quicksand_Medium.of(size: 18)
        
    }
    
    @IBAction func FormDropDownBtnAction(_ sender: Any) {
        let objForm :MedicationCartViewController  = MedicationCartViewController(nibName:"MedicationCartViewController",bundle:nil)
        self.navigationController?.pushViewController(objForm, animated: true)
    }
    
    @IBAction func searchMediciansBtnAction(_ sender: Any) {
        let objForm :MedicationCartViewController  = MedicationCartViewController(nibName:"MedicationCartViewController",bundle:nil)
        self.navigationController?.pushViewController(objForm, animated: true)
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
