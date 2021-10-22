//
//  ClubModel.swift
//  Planet365UIKit
//
//  Created by Vladimir Lukic on 20.10.21..
//

import UIKit

class ClubModel: BaseModel {

    // MARK:- Properties
    
    // Info
    var name: String? = ""
    var league: LeagueModel? = LeagueModel()
    
    // MARK:- Constructors
    
    override init() {
        super.init()
    }
    
    init(id: Int, name: String, league: LeagueModel, created: String = "") {
        super.init(id: id, created: created)
        self.name = name
        self.league = league
    }
    
    // Decoding
    required init (from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container =  try decoder.container (keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent (String.self, forKey: .name)
        league = try container.decodeIfPresent (LeagueModel.self, forKey: .league)
    }
    
    // Encoding
    override func encode (to encoder: Encoder) throws {
        try super.encode(to: encoder)
        
        // Add specification for model
        var container = encoder.container (keyedBy: CodingKeys.self)
        try container.encodeIfPresent (name, forKey: .name)
        try container.encodeIfPresent (league, forKey: .league)
    }
    
    // Hashable
    override func hash(into hasher: inout Hasher) {
        super.hash(into: &hasher)
        
        // Hash specification for model
        hasher.combine(name)
        hasher.combine(league)
    }
    
    // CodingKeys for properties
    enum CodingKeys: String, CodingKey {
        
        // Info
        case name = "name"
        case league = "league"
    }
}
