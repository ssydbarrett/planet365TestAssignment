//
//  HomeBasketballInteractor.swift
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

protocol HomeBasketballBusinessLogic
{
  func doSomething(request: HomeBasketball.Something.Request)
}

protocol HomeBasketballDataStore
{
  //var name: String { get set }
}

class HomeBasketballInteractor: HomeBasketballBusinessLogic, HomeBasketballDataStore
{
  var presenter: HomeBasketballPresentationLogic?
  var worker: HomeBasketballWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: HomeBasketball.Something.Request)
  {
    worker = HomeBasketballWorker()
    worker?.doSomeWork()
    
    let response = HomeBasketball.Something.Response()
    presenter?.presentSomething(response: response)
  }
}