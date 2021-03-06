//
//  NoDataInteractor.swift
//  Planet365UIKit
//
//  Created by Vladimir Lukic on 21.10.21..
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol NoDataBusinessLogic
{
  func doSomething(request: NoData.Something.Request)
}

protocol NoDataDataStore
{
  //var name: String { get set }
}

class NoDataInteractor: NoDataBusinessLogic, NoDataDataStore
{
  var presenter: NoDataPresentationLogic?
  var worker: NoDataWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: NoData.Something.Request)
  {
    worker = NoDataWorker()
    worker?.doSomeWork()
    
    let response = NoData.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
