//
//  LeagueModel.swift
//  Planet365UIKit
//
//  Created by Vladimir Lukic on 20.10.21..
//

import UIKit

class LeagueModel: BaseModel {

    // MARK:- Properties
    
    // Info
    var name: String? = ""
    var country: String? = ""
    var rank: Int? = 0
    var sport: SportModel? = SportModel()
    
    
    // MARK:- Constructors
    
    override init() {
        super.init()
    }
    
    init(id: Int, name: String, country: String, rank: Int, sport: SportModel, created: String = "") {
        super.init(id: id, created: created)
        self.name = name
        self.country = country
        self.rank = rank
        self.sport = sport
    }
    
    // Decoding
    required init (from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container =  try decoder.container (keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent (String.self, forKey: .name)
        country = try container.decodeIfPresent (String.self, forKey: .country)
        rank = try container.decodeIfPresent (Int.self, forKey: .rank)
        sport = try container.decodeIfPresent (SportModel.self, forKey: .sport)
    }
    
    // Encoding
    override func encode (to encoder: Encoder) throws {
        try super.encode(to: encoder)
        
        // Add specification for model
        var container = encoder.container (keyedBy: CodingKeys.self)
        try container.encodeIfPresent (name, forKey: .name)
        try container.encodeIfPresent (country, forKey: .country)
        try container.encodeIfPresent (rank, forKey: .rank)
        try container.encodeIfPresent (sport, forKey: .sport)
    }
    
    // Hashable
    override func hash(into hasher: inout Hasher) {
        super.hash(into: &hasher)
        
        // Hash specification for model
        hasher.combine(name)
        hasher.combine(country)
        hasher.combine(rank)
        hasher.combine(sport)
    }
    
    // CodingKeys for properties
    enum CodingKeys: String, CodingKey {
        
        // Info
        case name = "name"
        case country = "country"
        case rank = "rank"
        case sport = "sport"
    }
}
