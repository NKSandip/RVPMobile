//
//  AppDelegate.swift
//  RvpMobile
//
//  Created by Rameshbhai Patel on 25/01/18.
//  Copyright © 2018 Rameshbhai Patel. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics
import IQKeyboardManagerSwift
import FAPanels

let IS_IPAD = UIDevice.current.userInterfaceIdiom == .pad
let IS_IPHONE = UIDevice.current.userInterfaceIdiom == .phone
let IS_RETINA = UIScreen.main.scale >= 2.0

let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
let SCREEN_MAX_LENGTH = max(SCREEN_WIDTH, SCREEN_HEIGHT)
let SCREEN_MIN_LENGTH = min(SCREEN_WIDTH, SCREEN_HEIGHT)

let IS_IPHONE_4_OR_LESS = (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
let IS_IPHONE_5 = (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
let IS_IPHONE_6 = (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
let IS_IPHONE_6P = (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,FAPanelStateDelegate {

    var window: UIWindow?
    var mainVC = FAPanelController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Fabric for crashlytics
        Fabric.with([Crashlytics.self()])
        
        self.changeNavigationAttribute()
        self.enableInputAccessoryView()
        self.configureNavigationItems()
        
        let objWelComeView :HomeViewController  = HomeViewController(nibName:"HomeViewController",bundle:nil)
        self.openViewController(Controller: objWelComeView)
        
        return true
    }
    public func openViewController(Controller : UIViewController) {
        let objSideViewController :SideMenuViewController  = SideMenuViewController(nibName:"SideMenuViewController",bundle:nil)

        let centerNavVC = UINavigationController(rootViewController: Controller)
        let btnHome = UIImage(named: "Home_Side")
        Controller.navigationItem.leftBarButtonItem = UIBarButtonItem(image: btnHome, style: .plain, target: self, action:  #selector(barButtonDidTap(_:)))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH - 100, height: 40))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "Sign_Top_Logo")
        imageView.image = image
        Controller.navigationItem.titleView = imageView
        
        mainVC.configs.rightPanelWidth = 80
        mainVC.leftPanelPosition = .front
        mainVC.configs.bounceOnRightPanelOpen = false
        _ = mainVC.center(centerNavVC).left(objSideViewController).right(nil)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        self.window?.rootViewController = mainVC
        self.window?.makeKeyAndVisible()
    }
    @objc func barButtonDidTap(_ sender: UIBarButtonItem)
    {
        mainVC.openLeft(animated: true)
    }
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

// This extenstion create for some delegate common methods used.
extension AppDelegate {
    
    // MARK: - App Delegate Ref
    class func delegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    public func changeNavigationAttribute(){
        UINavigationBar.appearance().barTintColor = Color.secondaryGrayColor.value
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white,NSAttributedStringKey.font: CustomFont.font_Quicksand_Bold.of(size: 18) as Any]
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    // MARK: - Configure IQKeyboardManager
    fileprivate func enableInputAccessoryView() {
        IQKeyboardManager.sharedManager().enable = true
        IQKeyboardManager.sharedManager().toolbarTintColor = UIColor.blue
        IQKeyboardManager.sharedManager().shouldShowTextFieldPlaceholder = false
        IQKeyboardManager.sharedManager().enableAutoToolbar = true
    }
    
    //MARK: - Configure Navigation items
    func configureNavigationItems(){
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(0, -80.0), for: .default)
    }
}
extension UIBarButtonItem {
    class func itemWith(colorfulImage: UIImage?, target: AnyObject, action: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .custom)
        button.setImage(colorfulImage, for: .normal)
        button.frame = CGRect(x: 0.0, y: 0.0, width: 44.0, height: 44.0)
        button.addTarget(target, action: action, for: .touchUpInside)
        
        let barButtonItem = UIBarButtonItem(customView: button)
        return barButtonItem
    }
}
extension UIScreen {
    var isPhone4: Bool {
        return UIScreen.main.nativeBounds.size.height == 960;
    }
    
    var isPhone5: Bool {
        
        return UIScreen.main.nativeBounds.size.height == 1136;
    }
    
    var isPhone6: Bool {
        return UIScreen.main.nativeBounds.size.height == 1334;
    }
    
    var isPhone6Plus: Bool {
        return UIScreen.main.nativeBounds.size.height == 2208;
    }

}
