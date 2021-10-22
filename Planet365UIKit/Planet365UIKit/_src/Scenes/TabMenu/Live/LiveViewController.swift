//
//  LiveViewController.swift
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

protocol LiveDisplayLogic: AnyObject
{
    func displaySomething(viewModel: Live.Something.ViewModel)
}

class LiveViewController: BaseViewController, LiveDisplayLogic
{
    var interactor: LiveBusinessLogic?
    var router: (NSObjectProtocol & LiveRoutingLogic & LiveDataPassing)?
    
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
        let interactor = LiveInteractor()
        let presenter = LivePresenter()
        let router = LiveRouter()
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
        
        // Set title label
        self.lblTitle.textColor = Color.foregroundWhite
    }
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func doSomething()
    {
        let request = Live.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: Live.Something.ViewModel)
    {
        //nameTextField.text = viewModel.name
    }
}
