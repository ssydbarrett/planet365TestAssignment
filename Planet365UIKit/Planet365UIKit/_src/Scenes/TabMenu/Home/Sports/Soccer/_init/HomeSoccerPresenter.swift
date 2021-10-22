//
//  HomeSoccerPresenter.swift
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

protocol HomeSoccerPresentationLogic
{
    func presentInitControllers(response: HomeSoccer.InitControllers.Response)
    func presentControllersSwitch(response: HomeSoccer.Switch.Response)
}

class HomeSoccerPresenter: HomeSoccerPresentationLogic
{
    
    
    weak var viewController: HomeSoccerDisplayLogic?
    
    // MARK: Switch controllers
    
    func presentInitControllers(response: HomeSoccer.InitControllers.Response) {
        viewController?.displayInitControllers(viewModel: HomeSoccer.InitControllers.ViewModel())
    }
    
    func presentControllersSwitch(response: HomeSoccer.Switch.Response) {
        viewController?.displayControllersSwitch(viewModel: HomeSoccer.Switch.ViewModel(indexSegmented: response.indexSegmented, indexHeader: response.indexHeader))
    }
}
