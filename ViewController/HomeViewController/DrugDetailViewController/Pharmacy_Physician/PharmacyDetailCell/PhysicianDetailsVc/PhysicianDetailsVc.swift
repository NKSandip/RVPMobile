//
//  PhysicianDetailsVc.swift
//  RvpMobile
//
//  Created by Rameshbhai Patel on 21/02/18.
//  Copyright © 2018 Rameshbhai Patel. All rights reserved.
//

import UIKit

class PhysicianDetailsVc: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tblPhysician : UITableView?
    @IBOutlet weak var btnAddPhysician : UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        tblPhysician?.estimatedRowHeight = 60
        tblPhysician?.rowHeight = UITableViewAutomaticDimension;
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.setBackButton()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "MedicationForCell"
        var cell: MedicationForCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? MedicationForCell
        if cell == nil {
            tableView.register(UINib(nibName: "MedicationForCell", bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? MedicationForCell
        }
        cell.viewLine?.isHidden = true
        if indexPath.row == 0 {
            cell.lblName?.text = "Ordering for myself"
            cell.lblRelation?.text = ""
            cell.viewLine?.isHidden = false
        }else if indexPath.row == 1 {
            cell.lblName?.text = "Barack Dominar"
            cell.lblRelation?.text = "Spouse"
        }else if indexPath.row == 2 {
            cell.lblName?.text = "Patrick Dominar"
            cell.lblRelation?.text = "Father"
        }else if indexPath.row == 3 {
            cell.lblName?.text = "Vini Dominar"
            cell.lblRelation?.text = "Mother"
        }else{
            cell.lblName?.text = "Ellie Rutherford"
            cell.lblRelation?.text = "Daughter"
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: {
                let objPharmacy : PharmacyAddressVc = PharmacyAddressVc(nibName : "PharmacyAddressVc",bundle:nil)
                objPharmacy.modalPresentationStyle = .overCurrentContext
                self.customPresentViewController(presenter, viewController: objPharmacy, animated: true, completion: nil)
            })
        }
    }
    @IBAction func AddNewPhysicianBtnAction(_ sender: Any) {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion:nil)
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
