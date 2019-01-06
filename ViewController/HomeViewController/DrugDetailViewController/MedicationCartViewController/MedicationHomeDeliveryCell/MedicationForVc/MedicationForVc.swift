//
//  MedicationForVc.swift
//  RvpMobile
//
//  Created by Rameshbhai Patel on 15/02/18.
//  Copyright © 2018 Rameshbhai Patel. All rights reserved.
//

import UIKit

class MedicationForVc: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var viewBecomeHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var viewMedication: UIView!
    @IBOutlet weak var viewMedicationMain: UIView!

    @IBOutlet weak var viewMedicationTitle: UIView?
    @IBOutlet weak var lblMedicationTitle: UILabel?
    
    @IBOutlet weak var lblChooseTitle: UILabel?
    @IBOutlet weak var viewChooseTitle: UIView?
    
    @IBOutlet weak var tblMedication : UITableView?
    @IBOutlet weak var btnSelect : UIButton?
    
    override func viewDidLoad() {
        tblMedication?.estimatedRowHeight = 60
        tblMedication?.rowHeight = UITableViewAutomaticDimension;
        self.setFontColorAttribute() // set font and color
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.setBackButton()
    }
    
    func setFontColorAttribute() {
        self.viewBecomeHeightConstraint.constant = 320
        
        self.viewMedication?.backgroundColor = Color.lightWhiteColor.value
        self.viewMedication?.layer.cornerRadius = 4.0
        self.viewMedication?.layer.masksToBounds = true

        self.viewMedicationTitle?.backgroundColor = Color.primaryRedColor.value
        self.lblMedicationTitle?.font = CustomFont.font_Quicksand_Bold.of(size: 16)
        self.lblMedicationTitle?.textColor = Color.lightWhiteColor.value
        
        self.viewChooseTitle?.backgroundColor = Color.lightYellowColor.value
        self.viewChooseTitle?.layer.cornerRadius = (self.viewChooseTitle?.frame.size.height)! / 2
        self.viewChooseTitle?.layer.masksToBounds = true
        self.lblChooseTitle?.font = CustomFont.font_Quicksand_Medium.of(size: 11)
        self.lblChooseTitle?.textColor = Color.secondaryGrayColor.value
        
        self.btnSelect?.layer.cornerRadius = 4.0
        self.btnSelect?.layer.masksToBounds = true
        self.btnSelect?.setTitle("SELECT", for: .normal)
        self.btnSelect?.titleLabel?.textColor = Color.lightWhiteColor.value
        self.btnSelect?.backgroundColor = Color.primaryRedColor.value
        self.btnSelect?.titleLabel?.font =  CustomFont.font_Quicksand_Bold.of(size: 18)
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
        if indexPath.section != 0 {
            //            let objHome :HomeViewController  = HomeViewController(nibName:"HomeViewController",bundle:nil)
            //            AppDelegate.openViewController(objHome : HomeViewController)
        }
    }
    @IBAction func selectBtnAction(_ sender: Any) {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
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
