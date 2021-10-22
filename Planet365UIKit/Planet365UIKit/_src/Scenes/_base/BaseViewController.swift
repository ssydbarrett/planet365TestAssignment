//
//  BaseViewController.swift
//  Planet365UIKit
//
//  Created by Vladimir Lukic on 19.10.21..
//

import UIKit

// Base view controller type
enum ViewType {
    case PUSH
    case PRESENT
}

class BaseViewController: UIViewController {

    // MARK: - Outlets
    // MARK:
    
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var constraintBtnBack: NSLayoutConstraint!
    @IBOutlet weak var constraintImgBack: NSLayoutConstraint!
    @IBOutlet weak var btnMenu: UIButton!
    @IBOutlet weak var imgBackground: UIImageView!
    @IBOutlet var imgsDividers: [UIImageView]!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var viewActivityIndicator: UIView!
    
    // Header
    @IBOutlet weak var constraintStatusBarHeight: NSLayoutConstraint!
    @IBOutlet weak var viewStatusBar: UIView!
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var constraintHeaderHeight: NSLayoutConstraint!
    
    // Footer
    @IBOutlet weak var constraintStatusFooterHeight: NSLayoutConstraint!
    
    // MARK: - Properties
    // MARK:
    
    // View Type
    var viewType = ViewType.PUSH
    
    // Params tranported through multiple view controllers
    var params = NSDictionary()
    
    // MARK: - Lifecycle
    // MARK:

    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure status bar & header
        if constraintStatusBarHeight != nil {
            constraintStatusBarHeight.constant = 20.0 // 0.0
            if Utils.hasTopNotch() == true {
                constraintStatusBarHeight.constant = constraintStatusBarHeight.constant + 24.0 // 44.0
            }
        }
        
        // Configure footer bar
        if constraintStatusFooterHeight != nil {
            constraintStatusFooterHeight.constant = 0.0
            if Utils.hasTopNotch() == true {
                constraintStatusFooterHeight.constant = constraintStatusFooterHeight.constant + 26.0
            }
        }
        
        // Configure back button
        if btnBack != nil {
            Utils.configureButton(button: btnBack, title: "", font: nil, titleColor: Color.foregroundWhite, titleColorHighlighted: Color.foregroundWhite, backgroundImage: nil)
            
            let templateImage = btnBack.image(for: .normal)?.withRenderingMode(.alwaysTemplate)
            btnBack.setImage(templateImage, for: .normal)
            btnBack.tintColor = Color.foregroundWhite
        }
        if constraintBtnBack != nil {
            if Utils.getScreenSize().width <= 320.0 && btnBack != nil {
                btnBack.titleEdgeInsets = UIEdgeInsets(top: 2, left: 30, bottom: 0, right: 0)
                constraintBtnBack.constant = 80.0
            }
        }
        if constraintImgBack != nil {
            if Utils.getScreenSize().width <= 320.0 {
                constraintImgBack.constant = 30.0
            }
        }
        
        // Configure dividers
        if imgsDividers != nil {
            for _ in imgsDividers {
            }
        }
        
        // Register for notification
        registerForNotifications()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override var preferredStatusBarStyle : UIStatusBarStyle {
//        return .lightContent
//    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    // MARK: - Navigation
    // MARK:
    
    // Segue handling
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Check if segue is modal
        if segue.destination is BaseViewController {
            if segue.destination.presentingViewController != nil {
                
                // Modal segue
                (segue.destination as! BaseViewController).viewType = ViewType.PRESENT
            } else {
                
                // Push segue
                (segue.destination as! BaseViewController).viewType = ViewType.PUSH
            }
        }
    }
    
    // Push to view controller
    func pushToViewController(vc: String, storyboardName:String, params: NSDictionary?) {
        goToViewControllerWithIdentifier(vc: vc, params: params, storyBoardName: storyboardName , push: true)
    }
    
    // Present view controller
    func presentToViewController(vc: String, storyboardName: String, params: NSDictionary?) {
        goToViewControllerWithIdentifier(vc: vc, params: params, storyBoardName: storyboardName, push: false)
    }
    
    // Go to initiate storyboard
    func goToStoryboardWithName(storyBoardName: String) {
        goToViewControllerWithIdentifier(vc: nil, params: nil, storyBoardName: storyBoardName, push: true)
    }
    
    // Go to view controller with identifier
    private func goToViewControllerWithIdentifier(vc: String?, params: NSDictionary?, storyBoardName: String?, push: Bool) {
        
        let selectedStoryBoard = storyBoardName == nil ? self.storyboard : UIStoryboard(name: storyBoardName!, bundle: nil)
        
        // Instance new view controller
        if vc == nil {
            if selectedStoryBoard?.instantiateInitialViewController() is UINavigationController {
                let secondViewController = selectedStoryBoard?.instantiateInitialViewController() as! UINavigationController
                if navigationController == nil {
                    (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController = secondViewController
                } else {
                    self.navigationController?.pushViewController(secondViewController, animated: true)
                }
            } else {
                let secondViewController = selectedStoryBoard?.instantiateInitialViewController() as! BaseViewController
                if navigationController == nil {
                    (UIApplication.shared.delegate as! AppDelegate).window?.rootViewController = secondViewController
                } else {
                    self.navigationController?.pushViewController(secondViewController, animated: true)
                }
            }
            return
        }
        
        // Check if navigation controller
        if selectedStoryBoard?.instantiateViewController(withIdentifier: vc!) is UINavigationController {
            let secondViewController = selectedStoryBoard?.instantiateViewController(withIdentifier: vc!) as! UINavigationController
            if push {
                
                // Than present view controller
                self.present(secondViewController, animated: true, completion: nil)
            } else {
                self.present(secondViewController, animated: true, completion: nil)
            }
            return
        }
        
        // Instance view controller
        let secondViewController = selectedStoryBoard?.instantiateViewController(withIdentifier: vc!) as! BaseViewController
        
        // Add params
        if params != nil {
            secondViewController.params = params!
        }
        
        // Push or present new view controller
        if push {
            secondViewController.viewType = ViewType.PUSH
            self.navigationController?.pushViewController(secondViewController, animated: true)
            
        } else {
            secondViewController.viewType = ViewType.PRESENT
            self.present(secondViewController, animated: true, completion: nil)
        }
    }
    
    // MARK: - Activity indicator handling
    // MARK:
    
    // Start acitivity indicator
    func startActivityIndicator(onView: UIView? = nil, color: UIColor? = nil) {
        
        // Guard activity indicator and color
        let activityIndicatorView = onView ?? self.viewActivityIndicator!
        let activityIndicatorColor = color ?? Color.foregroundBlack
        
        // Bring subview to front
        activityIndicatorView.superview?.bringSubviewToFront(activityIndicatorView)
        
        // Configure custom activity indicator
        let activityIndicator = NVActivityIndicatorView(frame: activityIndicatorView.bounds, type: .circleStrokeSpin, color: activityIndicatorColor, padding: 0)
        activityIndicatorView.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    // MARK: - Outlet Actions
    // MARK:
    
    // Back button action
    @IBAction func goBack(sender: UIButton) {
        
        // Pop or dismiss previus VC
        if viewType == ViewType.PUSH {
            let vc = self.navigationController?.popViewController(animated: true)
            if vc != nil {
                print(vc?.restorationIdentifier as Any)
            }
        } else {
            dismiss(animated: true, completion: nil)
        }
        
        // Unregister for notification
        unregisterForNotifications()
    }
    
    // MARK: - Notification handling
    // MARK:
    
    // Registrer for notification
    func registerForNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(BaseViewController.notificationTest(notification:)), name: NSNotification.Name("notification_test"), object: nil)
        
    }
    
    // Unregister for notification
    func unregisterForNotifications() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("notification_test"), object: nil)
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Notification selectors
    // MARK:
    
    @objc func notificationTest(notification: Notification) {
        
    }
}
