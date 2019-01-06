//
//  PharmacyDetailsVc.swift
//  RvpMobile
//
//  Created by Rameshbhai Patel on 20/02/18.
//  Copyright © 2018 Rameshbhai Patel. All rights reserved.
//

import UIKit

class PharmacyDetailsVc: UIViewController, UITableViewDelegate, UITableViewDataSource, PharmacyDetailCellDelegate{
    @IBOutlet weak var tblPharmacy : UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Physician / Pharmacy Detail"
        self.tblPharmacy?.estimatedRowHeight = 100
        self.tblPharmacy?.rowHeight = UITableViewAutomaticDimension
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.setBackButton()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "PharmacyDetailCell"
        var cell: PharmacyDetailCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? PharmacyDetailCell
        if cell == nil {
            tableView.register(UINib(nibName: "PharmacyDetailCell", bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? PharmacyDetailCell
        }
        cell.delegate = self
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func selectPhysicianAtIndex(medicationCell: PharmacyDetailCell, index: NSInteger) {
        let objPhysician : PhysicianDetailsVc  = PhysicianDetailsVc(nibName:"PhysicianDetailsVc",bundle:nil)
        objPhysician.modalPresentationStyle = .overCurrentContext
        self.customPresentViewController(presenter, viewController: objPhysician, animated: true, completion: nil)
    }
    
    func selectPharmacyAtIndex(medicationCell: PharmacyDetailCell, index: NSInteger) {
        let objPharmacy : PharmacyAddressVc = PharmacyAddressVc(nibName : "PharmacyAddressVc",bundle:nil)
        self.navigationController?.pushViewController(objPharmacy, animated: true)
    }

    @IBAction func saveBtnAction(_ sender:Any) {
        let objOrder : OrderViewController  = OrderViewController(nibName:"OrderViewController",bundle:nil)
        self.navigationController?.pushViewController(objOrder, animated: true)
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
