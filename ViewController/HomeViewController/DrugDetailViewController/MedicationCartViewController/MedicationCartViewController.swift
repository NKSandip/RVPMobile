//
//  MedicationCartViewController.swift
//  RvpMobile
//
//  Created by Rameshbhai Patel on 10/02/18.
//  Copyright © 2018 Rameshbhai Patel. All rights reserved.
//

import UIKit

class MedicationCartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MedicationRetailDelegate,MedicationDeliveryCellDelegate {
    @IBOutlet weak var viewPrice : UIView?
    @IBOutlet weak var lblSelectedMeds : UILabel?
    @IBOutlet weak var lblMedsPrice : UILabel?
    
    @IBOutlet weak var segCart : UISegmentedControl?
    @IBOutlet weak var tblCart : UITableView?
    @IBOutlet weak var btnProcessCart : UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblCart?.estimatedRowHeight = 100
        self.tblCart?.rowHeight = UITableViewAutomaticDimension
        self.setFontColorAttribute()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.setBackButton()
        self.initUI()
    }
    // MARK: - init
    
    func initUI() {
        if self.navigationController == nil {
            return
        }
        
        // Create a navView to add to the navigation bar
        let navView = UIView()
        
        // Create the label
        let label = UILabel()
        label.text = "Medication Cart"
        label.sizeToFit()
        label.textColor = Color.lightWhiteColor.value
        label.font = CustomFont.font_Quicksand_Medium.of(size: 16)
        label.center = navView.center
        label.textAlignment = NSTextAlignment.center
        
        // Create the image view
        let image = UIImageView()
        image.image = UIImage(named: "Order_Cart_White")
        // To maintain the image's aspect ratio:
        let imageAspect = image.image!.size.width/image.image!.size.height
        // Setting the image frame so that it's immediately before the text:
        image.frame = CGRect(x: label.frame.origin.x-label.frame.size.height*imageAspect, y: label.frame.origin.y, width: label.frame.size.height*imageAspect, height: label.frame.size.height)
        image.contentMode = UIViewContentMode.scaleAspectFit
        
        // Add both the label and image view to the navView
        navView.addSubview(label)
        navView.addSubview(image)
        
        // Set the navigation bar's navigation item's titleView to the navView
        self.navigationItem.titleView = navView
        
        // Set the navView's frame to fit within the titleView
        navView.sizeToFit()
        
    }
    func setFontColorAttribute() {
        self.viewPrice?.backgroundColor = Color.secondaryGrayColor.value
        self.lblMedsPrice?.font = CustomFont.font_Quicksand_Medium.of(size: 16)
        self.lblMedsPrice?.textColor = Color.lightWhiteColor.value
        self.lblSelectedMeds?.font = CustomFont.font_Quicksand_Medium.of(size: 14)
        self.lblSelectedMeds?.textColor = Color.lightWhiteColor.value

        let attributes = [NSAttributedStringKey.foregroundColor : Color.primaryRedColor.value,NSAttributedStringKey.font : CustomFont.font_Quicksand_Regular.of(size: 14)];
        let attributesSelected = [NSAttributedStringKey.foregroundColor : Color.lightWhiteColor.value,NSAttributedStringKey.font : CustomFont.font_Quicksand_Bold.of(size: 14)];
        segCart?.setTitleTextAttributes((attributes as Any as! [AnyHashable : Any]), for: UIControlState.normal)
        segCart?.setTitleTextAttributes((attributesSelected as Any as! [AnyHashable : Any]), for: UIControlState.selected)
        
        self.btnProcessCart?.titleLabel?.textColor = Color.lightWhiteColor.value
        self.btnProcessCart?.titleLabel?.font =  CustomFont.font_Quicksand_Medium.of(size: 16)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row >= 4{
            let identifier = "MedicationRetailCell"
            var cell: MedicationRetailCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? MedicationRetailCell
            if cell == nil {
                tableView.register(UINib(nibName: "MedicationRetailCell", bundle: nil), forCellReuseIdentifier: identifier)
                cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? MedicationRetailCell
            }
            cell.delegate = self
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        }
        let identifier = "MedicationHomeDeliveryCell"
        var cell: MedicationHomeDeliveryCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? MedicationHomeDeliveryCell
        if cell == nil {
            tableView.register(UINib(nibName: "MedicationHomeDeliveryCell", bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? MedicationHomeDeliveryCell
        }
        cell.delegate = self
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let objDeliveryAddressVc :DeliveryAddressVc  = DeliveryAddressVc(nibName:"DeliveryAddressVc",bundle:nil)
        self.navigationController?.pushViewController(objDeliveryAddressVc, animated: true)
    }
    
    func selectDependentAtIndex(medicationCell: MedicationRetailCell, index: NSInteger) {
        let objMedicationForVc :MedicationForVc  = MedicationForVc(nibName:"MedicationForVc",bundle:nil)
        objMedicationForVc.modalPresentationStyle = .overCurrentContext
        self.customPresentViewController(presenter, viewController: objMedicationForVc, animated: true, completion: nil)
    }
    func selectDependentAtIndex(medicationCell: MedicationHomeDeliveryCell, index: NSInteger) {
        let objMedicationForVc :MedicationForVc  = MedicationForVc(nibName:"MedicationForVc",bundle:nil)
        objMedicationForVc.modalPresentationStyle = .overCurrentContext
        self.customPresentViewController(presenter, viewController: objMedicationForVc, animated: true, completion: nil)
    }
    func selectDeliveryAtIndex(medicationCell: MedicationHomeDeliveryCell, index: NSInteger) {
        let objDeliveryAddress :DeliveryAddressVc  = DeliveryAddressVc(nibName:"DeliveryAddressVc",bundle:nil)
        self.navigationController?.pushViewController(objDeliveryAddress, animated: true)
    }
    @IBAction func processToCartBtnAction(_ sender: Any) {
        let objPharmacy :PharmacyDetailsVc  = PharmacyDetailsVc(nibName:"PharmacyDetailsVc",bundle:nil)
        self.navigationController?.pushViewController(objPharmacy, animated: true)
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
