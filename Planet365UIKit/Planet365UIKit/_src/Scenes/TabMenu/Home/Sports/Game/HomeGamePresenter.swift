//
//  HomeGamePresenter.swift
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

protocol HomeGamePresentationLogic
{
  func presentSomething(response: HomeGame.Something.Response)
}

class HomeGamePresenter: HomeGamePresentationLogic
{
  weak var viewController: HomeGameDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: HomeGame.Something.Response)
  {
    let viewModel = HomeGame.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}