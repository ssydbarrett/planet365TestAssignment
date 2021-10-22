//
//  HomePlayerPresenter.swift
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

protocol HomePlayerPresentationLogic
{
  func presentSomething(response: HomePlayer.Something.Response)
}

class HomePlayerPresenter: HomePlayerPresentationLogic
{
  weak var viewController: HomePlayerDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: HomePlayer.Something.Response)
  {
    let viewModel = HomePlayer.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
