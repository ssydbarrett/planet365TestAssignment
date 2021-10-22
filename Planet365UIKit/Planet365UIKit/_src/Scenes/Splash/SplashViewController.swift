//
//  SplashViewController.swift
//  Planet365UIKit
//
//  Created by Vladimir Lukic on 19.10.21..
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol SplashDisplayLogic: AnyObject
{
}

class SplashViewController: BaseViewController, SplashDisplayLogic
{
    
    var interactor: SplashBusinessLogic?
    var router: (NSObjectProtocol & SplashRoutingLogic & SplashDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = SplashInteractor()
        let presenter = SplashPresenter()
        let router = SplashRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: Outlets
    
    @IBOutlet weak var imgLogo: UIImageView!
    
    // MARK: Properties
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Configure view
        configureView()
        
        // Animate splash screen
        animateSplash()
    }
    
    // MARK: - Configuration
    // MARK:
    
    func configureView() {
        
        // Set background
        self.view.backgroundColor = Color.backgroundYellow
    }
    
    // MARK: - Animation
    // MARK:
    
    func animateSplash() {
        
        // Animate logo
        UIView.animate(withDuration: 1.5, delay: 0.0, options: .transitionCrossDissolve, animations: {
            self.imgLogo.alpha = 1.0
        }) { (completed) in
            
            // Start activity indicator
            self.startActivityIndicator()
            
            // Go to main tab view controller
            let seconds = 2.5
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                self.pushToViewController(vc: "TabMenuContainerViewController", storyboardName: "Main", params: nil)
            }
        }
    }
    
//    // Start acitivity indicator
//    func startActivityIndicator() {
//
//        // Configure custom activity indicator
//        let activityIndicator = NVActivityIndicatorView(frame: self.viewActivityIndicator.bounds, type: .circleStrokeSpin, color: Color.foregroundBlack, padding: 0)
//        self.viewActivityIndicator.addSubview(activityIndicator)
//        activityIndicator.startAnimating()
//    }
}