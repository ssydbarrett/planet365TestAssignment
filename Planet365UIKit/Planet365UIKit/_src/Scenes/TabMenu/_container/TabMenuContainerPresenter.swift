//
//  TabMenuContainerPresenter.swift
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

protocol TabMenuContainerPresentationLogic
{
    // List of ContainerPresenter functions
    func presentViewControllerInitialisation(response: TabMenuContainer.InitControllers.Response)
    func presentTabBarButtons(response: TabMenuContainer.TabButton.Response)
    func presentLoginUser(response: TabMenuContainer.Login.Response)
    func presentRegisterUser(response: TabMenuContainer.Register.Response)
}

class TabMenuContainerPresenter: TabMenuContainerPresentationLogic
{
    weak var viewController: TabMenuContainerDisplayLogic?
    
    // MARK: - Implement presenter functions
    // MARK:
    
    // MARK: View controller initialisation
    
    func presentViewControllerInitialisation(response: TabMenuContainer.InitControllers.Response) {
        viewController?.displayInitControllers(viewModel: TabMenuContainer.InitControllers.ViewModel())
        
    }
    
    // MARK: Tab bar buttons handling
    
    func presentTabBarButtons(response: TabMenuContainer.TabButton.Response) {
        viewController?.displayTabButton(viewModel: TabMenuContainer.TabButton.ViewModel(sender: response.sender))
    }
    
    // MARK: Login user
    
    func presentLoginUser(response: TabMenuContainer.Login.Response) {
        viewController?.displayLoginUser(viewModel: TabMenuContainer.Login.ViewModel())
    }
    
    // MARK: Register user
    
    func presentRegisterUser(response: TabMenuContainer.Register.Response) {
        viewController?.displayRegisterUser(viewModel: TabMenuContainer.Register.ViewModel())
    }
}
