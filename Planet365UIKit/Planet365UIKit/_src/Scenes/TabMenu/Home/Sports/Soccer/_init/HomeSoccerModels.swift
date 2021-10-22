//
//  HomeSoccerModels.swift
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

enum HomeSoccer
{
    // MARK: Use cases
    
    // Init controllers model
    enum InitControllers
    {
        struct Request
        {
        }
        struct Response
        {
        }
        struct ViewModel
        {
        }
    }
    
    // Switch
    enum Switch
    {
        struct Request
        {
            var indexSegmented: Int
            var indexHeader: Int
        }
        struct Response
        {
            var indexSegmented: Int
            var indexHeader: Int
        }
        struct ViewModel
        {
            var indexSegmented: Int
            var indexHeader: Int
        }
    }
}
