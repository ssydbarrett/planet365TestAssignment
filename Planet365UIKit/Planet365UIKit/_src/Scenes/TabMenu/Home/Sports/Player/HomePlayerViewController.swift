//
//  HomePlayerViewController.swift
//  Planet365UIKit
//
//  Created by Vladimir Lukic on 22.10.21..
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HomePlayerDisplayLogic: AnyObject
{
  func displaySomething(viewModel: HomePlayer.Something.ViewModel)
}

class HomePlayerViewController: BaseViewController, HomePlayerDisplayLogic
{
  var interactor: HomePlayerBusinessLogic?
  var router: (NSObjectProtocol & HomePlayerRoutingLogic & HomePlayerDataPassing)?

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
    let interactor = HomePlayerInteractor()
    let presenter = HomePlayerPresenter()
    let router = HomePlayerRouter()
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
    let request = HomePlayer.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: HomePlayer.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
}