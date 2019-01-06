//
//  SideMenuViewController.swift
//  RvpMobile
//
//  Created by Rameshbhai Patel on 01/02/18.
//  Copyright © 2018 Rameshbhai Patel. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var arrSideImages = ["Side_My_Valet_Account", "Side_Diabetic_Program", "Side_Request_Refill", "Side_Medication_Reminder", "Side_My_RX_Valet_Card", "Side_FAQ", "Side_Privacy_Policy", "Side_Terms_Conditions"]
    
    var arrSideMenu = ["My Valet Account", "Diabetics Supply Program", "Request Refile", "Medication Reminder", "My Rx Valet Card", "Q & A (FAQs)", "Privacy & Policy", "Terms & Conditions"]

    @IBOutlet weak var tblSideView : UITableView?
    override func viewDidLoad() {
        self.edgesForExtendedLayout = UIRectEdge(rawValue: 0)
        self.tblSideView?.estimatedRowHeight = 44
        self.tblSideView?.rowHeight = UITableViewAutomaticDimension
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 50
        }
        return 44
    }
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else{
            return arrSideMenu.count
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 60
        }else{
            return 0.01
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let identifier = "SideRegisterCell"
            var cell: SideMenuRegisterCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? SideMenuRegisterCell
            if cell == nil {
                tableView.register(UINib(nibName: "SideMenuRegisterCell", bundle: nil), forCellReuseIdentifier: identifier)
                cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? SideMenuRegisterCell
            }
            cell.backgroundColor = Color.primaryRedColor.value
            cell.viewLine?.backgroundColor = Color.primaryRedColor.value
            cell.lblUserName?.text = ""
            cell.lblEmail?.text = ""
            cell.imgBG?.backgroundColor = .clear
            cell.viewImageBG?.isHidden = false
            cell.viewLabels?.isHidden = true
            cell.viewButtons?.isHidden = true
            return cell
        }
        return nil
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let identifier = "SideRegisterCell"
            var cell: SideMenuRegisterCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? SideMenuRegisterCell
            if cell == nil {
                tableView.register(UINib(nibName: "SideMenuRegisterCell", bundle: nil), forCellReuseIdentifier: identifier)
                cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? SideMenuRegisterCell
            }
            cell.lblUserName?.text = "GREGORY SANTULLI"
            cell.lblEmail?.text = "test@mail.com"
            cell.viewLabels?.isHidden = true
            cell.viewButtons?.isHidden = false
            return cell
        }else{
            let identifier = "sideMenu"
            var cell: SideMenuCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? SideMenuCell
            if cell == nil {
                tableView.register(UINib(nibName: "SideMenuCell", bundle: nil), forCellReuseIdentifier: identifier)
                cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? SideMenuCell
            }
            cell.lblMenuTitle.text = arrSideMenu[indexPath.row]
            let iconName = arrSideImages[indexPath.row]
            cell.imgMenu.image = UIImage(named: iconName)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section != 0 {
//            let objHome :HomeViewController  = HomeViewController(nibName:"HomeViewController",bundle:nil)
//            AppDelegate.openViewController(objHome : HomeViewController)
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
