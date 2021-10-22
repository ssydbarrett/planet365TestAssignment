//
//  LiveInteractor.swift
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

protocol LiveBusinessLogic
{
  func doSomething(request: Live.Something.Request)
}

protocol LiveDataStore
{
  //var name: String { get set }
}

class LiveInteractor: LiveBusinessLogic, LiveDataStore
{
  var presenter: LivePresentationLogic?
  var worker: LiveWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: Live.Something.Request)
  {
    worker = LiveWorker()
    worker?.doSomeWork()
    
    let response = Live.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
