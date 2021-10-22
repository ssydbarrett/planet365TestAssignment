//
//  MarcatorePresenter.swift
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

protocol MarcatorePresentationLogic
{
    func presentAPI(response: Marcatore.API.Response)
}

class MarcatorePresenter: MarcatorePresentationLogic
{
    weak var viewController: MarcatoreDisplayLogic?
    
    // MARK: Present response from API
    
    func presentAPI(response: Marcatore.API.Response)
    {
        
        // Get raw data from response
        let data: [[String: Any]] = response.response["data"] as? [[String: Any]] ?? [[String: Any]]()
        
        // Convert JSON / XML ressponse to model
        var model: [MoccupAPIModel]?
            do {
                
                // Get JSON Data
                // let jsonData = try? JSONSerialization.data(withJSONObject:data)
                
                // Convert to model
                // model = try JSONDecoder().decode([MoccupAPIModel].self, from: jsonData ?? Data())
                model = [MoccupAPIModel(
                    id: 1,
                    league: data[0]["league"] as? LeagueModel ?? LeagueModel(),
                    time: data[0]["time"] as? String ?? "",
                    games: data[0]["games"] as? [GameModel] ?? [GameModel](),
                    marcatoreArray: data[0]["marcatore"] as? [MarcatoreModel] ?? [MarcatoreModel]()
                )]
                
                // Display result in view controller
                print(model == nil ? "" : model!)
                print(data)
                viewController?.displayAPI(viewModel: Marcatore.API.ViewModel(response: model ?? [MoccupAPIModel]()))
                
            // Handle error
            } catch {
                print("Error : \(error.localizedDescription).")
                
                // Display Empty result
                viewController?.displayErrorAPI(viewModel: Marcatore.API.EmptyViewModel())
            }
    }
}
