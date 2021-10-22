//
//  HomeSportsViewController.swift
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

protocol HomeSportsDisplayLogic: AnyObject
{
    func displaySomething(viewModel: HomeSports.Something.ViewModel)
}

class HomeSportsViewController: BaseViewController, HomeSportsDisplayLogic
{
    var interactor: HomeSportsBusinessLogic?
    var router: (NSObjectProtocol & HomeSportsRoutingLogic & HomeSportsDataPassing)?
    
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
        let interactor = HomeSportsInteractor()
        let presenter = HomeSportsPresenter()
        let router = HomeSportsRouter()
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
    
    @IBOutlet var btnsLinks: [UIButton]!
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Configure view
        configureView()
    }
    
    // MARK: Configure view
    
    func configureView() {
        
        // Set background
        self.view.backgroundColor = Color.backgroundBlack
        
        for btn in btnsLinks {
            Utils.configureButton(button: btn, title: nil, font: nil, titleColor: Color.foregroundWhite, titleColorHighlighted: nil, backgroundImage: nil)
        }
    }
    
    // MARK: Button Actions
    
    // Open Soccer section
    @IBAction func openSoccerSection(_ sender: UIButton) {
        self.pushToViewController(vc: "HomeSoccerViewController", storyboardName: "Home", params: nil)
        handleBackButton()
    }
    
    // Open Basketball section
    @IBAction func openBasketballSection(_ sender: UIButton) {
        self.pushToViewController(vc: "HomeBasketballViewController", storyboardName: "Home", params: nil)
        handleBackButton()
    }
    
    // Open NFL section
    @IBAction func openNFLSection(_ sender: UIButton) {
        self.pushToViewController(vc: "HomeNFLViewController", storyboardName: "Home", params: nil)
        handleBackButton()
    }
    
    func handleBackButton() {
        NotificationCenter.default.post(name: TabMenuContainerViewController.notification_tab_menu_back_button_handling, object: nil, userInfo: nil)
    }
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func doSomething()
    {
        let request = HomeSports.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: HomeSports.Something.ViewModel)
    {
        //nameTextField.text = viewModel.name
    }
}
