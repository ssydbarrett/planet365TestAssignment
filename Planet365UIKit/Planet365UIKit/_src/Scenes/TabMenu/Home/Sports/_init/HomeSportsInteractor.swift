//
//  HomeSportsInteractor.swift
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

protocol HomeSportsBusinessLogic
{
  func doSomething(request: HomeSports.Something.Request)
}

protocol HomeSportsDataStore
{
  //var name: String { get set }
}

class HomeSportsInteractor: HomeSportsBusinessLogic, HomeSportsDataStore
{
  var presenter: HomeSportsPresentationLogic?
  var worker: HomeSportsWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: HomeSports.Something.Request)
  {
    worker = HomeSportsWorker()
    worker?.doSomeWork()
    
    let response = HomeSports.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
