//
//  HomeViewController.swift
//  RvpMobile
//
//  Created by Rameshbhai Patel on 01/02/18.
//  Copyright © 2018 Rameshbhai Patel. All rights reserved.
//

import UIKit
import CHTCollectionViewWaterfallLayout
//import WaterfallLayout
class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout {
    
    @IBOutlet weak var lblTitle : UILabel?
    @IBOutlet weak var searchbar : UITextField?
    @IBOutlet weak var collHome: UICollectionView!
    
    var rightBarButton: UIBarButtonItem!

    var arrSideMenu = ["My Valet Account My Valet Account", "Diabetics Supply Program", "Request Refile", "Medication Reminder", "My Rx Valet Card", "Q & A (FAQs)", "Privacy & Policy", "Terms & Conditions"]

    override func viewDidLoad() {
        self.title = ""
        self.edgesForExtendedLayout = UIRectEdge(rawValue: 0)
        
        // Attach datasource and delegate
        self.collHome.dataSource  = self
        self.collHome.delegate = self

        self.setupCollectionView()
        self.registerNibs()//Register nibs
        
        self.setFontColorAttribute()
        self.setNotificationCenter()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //MARK: - CollectionView UI Setup
    func setupCollectionView(){
        
        // Create a waterfall layout
        let layout = CHTCollectionViewWaterfallLayout()
        // Change individual layout attributes for the spacing between cells
        layout.minimumColumnSpacing = 8.0
        layout.minimumInteritemSpacing = 0.0
        layout.headerHeight = 50
        // Collection view attributes
        self.collHome.autoresizingMask = [UIViewAutoresizing.flexibleHeight, UIViewAutoresizing.flexibleWidth]
        self.collHome.alwaysBounceVertical = true
        
        // Add the waterfall layout to your collection view
        self.collHome.collectionViewLayout = layout
    }
    // Register CollectionView Nibs
    func registerNibs(){
        collHome.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCell")
        collHome.register(UINib(nibName: "HeaderView", bundle: nil), forSupplementaryViewOfKind: CHTCollectionElementKindSectionHeader, withReuseIdentifier: "HeaderView")
    }
    func setFontColorAttribute() {
        lblTitle?.font = CustomFont.font_Quicksand_Medium.of(size: 18)
        lblTitle?.textColor = Color.secondaryGrayColor.value
    }
    func setNotificationCenter() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handle),
                                               name: .showRegisterNotifications,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handle),
                                               name: .showSignInNotifications,
                                               object: nil)
    }
    
    // ----------------------------------------------------------------------------------------
    // HANDLE NOTIFICATION WITH PARAMETER
    // ----------------------------------------------------------------------------------------
    @objc func handle(withNotification notification : NSNotification) {
        print("RECEIVED SPECIFIC NOTIFICATION: \(notification.name)")
        panel!.configs.bounceOnCenterPanelChange = true

        if notification.name == .showRegisterNotifications   {
            panel!.center(self, afterThat: {
                print("Executing block after changing center panelVC From Left Menu")
                _ = self.panel!.left(nil)
                let objSignUp :WelcomeViewController  = WelcomeViewController(nibName:"WelcomeViewController",bundle:nil)
                self.navigationController?.pushViewController(objSignUp, animated: true)
            })
        }else if notification.name == .showSignInNotifications   {
            panel!.center(self, afterThat: {
                print("Executing block after changing center panelVC From Left Menu")
                _ = self.panel!.left(nil)
                let objSignIn :WelcomeViewController  = WelcomeViewController(nibName:"WelcomeViewController",bundle:nil)
                self.navigationController?.pushViewController(objSignIn, animated: true)
            })
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        self.addRightNavigationItems()
        self.navigationController?.isNavigationBarHidden = false
        super.viewWillAppear(true)
    }
    func addRightNavigationItems() {
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage.init(named: "Home_More"), for: UIControlState.normal)
        button.addTarget(self, action:#selector(HomeViewController.openMenu(sender:)), for:.touchUpInside)
        button.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30) //CGRectMake(0, 0, 30, 30)
        rightBarButton = UIBarButtonItem.init(customView: button)
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    @objc func openMenu(sender:UIBarButtonItem) {
        
    }
    
    @IBAction func phoenixBtnAction(_ sender: Any) {
        let objPhoenix :PhoenixViewController  = PhoenixViewController(nibName:"PhoenixViewController",bundle:nil)
        objPhoenix.modalPresentationStyle = .overCurrentContext
        self.customPresentViewController(presenter, viewController: objPhoenix, animated: true, completion: nil)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrSideMenu.count
    }
    func collectionView (_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets{
        return UIEdgeInsetsMake(10, 10, 10, 10)
        //(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: CHTCollectionViewWaterfallLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 50)
    }
    //** Size for the cells in the Waterfall Layout */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        // create a cell size from the image size, and return the size
        let imageSize = arrSideMenu[indexPath.row].size
        let size1: CGSize = imageSize([NSAttributedStringKey.font:  CustomFont.font_Quicksand_Regular.of(size: 14)!, NSAttributedStringKey.foregroundColor: Color.lightGrayColor.value])
        print(size1)
        let adjustedSize = CGSize(width: ceil(size1.width), height: ceil(size1.height))
        if adjustedSize.width > (SCREEN_WIDTH / 2){
            return CGSize(width: SCREEN_WIDTH, height: 30)
        }
        return CGSize(width: (SCREEN_WIDTH / 2), height: 30)
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
            
        case CHTCollectionElementKindSectionHeader:
            let headerView:HeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as! HeaderView
            if indexPath.section == 0{
                headerView.configure(with: "Allergies")
            }else if indexPath.section == 1{
                headerView.configure(with: "Blood Pressure")
            }else if indexPath.section == 2{
                headerView.configure(with: "Cholesterol")
            }else{
                headerView.configure(with: "Diabetes")
            }
            headerView.backgroundColor = UIColor.white;
            return headerView
            
        case CHTCollectionElementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Footer", for: indexPath as IndexPath)
            
            footerView.backgroundColor = UIColor.clear;
            return footerView
            
        default:
            
            assert(false, "Unexpected element kind")
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : HomeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCollectionViewCell
        cell.lblName?.text = arrSideMenu[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        let objDrugDetails :DrugDetailViewController  = DrugDetailViewController(nibName:"DrugDetailViewController",bundle:nil)
        self.navigationController?.pushViewController(objDrugDetails, animated: true)
        print(indexPath.section)
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

