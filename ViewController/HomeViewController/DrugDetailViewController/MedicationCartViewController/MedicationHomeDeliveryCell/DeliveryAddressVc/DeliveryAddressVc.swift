//
//  DeliveryAddressVc.swift
//  RvpMobile
//
//  Created by Rameshbhai Patel on 18/02/18.
//  Copyright © 2018 Rameshbhai Patel. All rights reserved.
//

import UIKit

class DeliveryAddressVc: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tblDelivery : UITableView?
    @IBOutlet weak var btnAddNewAddress : UIButton?
    override func viewDidLoad() {
        tblDelivery?.estimatedRowHeight = 60
        tblDelivery?.rowHeight = UITableViewAutomaticDimension;
        super.viewDidLoad()

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
        let identifier = "DeliveryAddressCell"
        var cell: DeliveryAddressCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? DeliveryAddressCell
        if cell == nil {
            tableView.register(UINib(nibName: "DeliveryAddressCell", bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? DeliveryAddressCell
        }
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section != 0 {
            //            let objHome :HomeViewController  = HomeViewController(nibName:"HomeViewController",bundle:nil)
            //            AppDelegate.openViewController(objHome : HomeViewController)
        }
    }
    @IBAction func btnAddNewAddressBtnAction(_ sender: Any) {
        let objForm :BillAddressViewController  = BillAddressViewController(nibName:"BillAddressViewController",bundle:nil)
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
