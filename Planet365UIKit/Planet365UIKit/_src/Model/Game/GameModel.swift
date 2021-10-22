//
//  GameModel.swift
//  Planet365UIKit
//
//  Created by Vladimir Lukic on 20.10.21..
//

import UIKit

class GameModel: BaseModel {

    // MARK:- Properties
    
    // Info
    var home: ClubModel? = ClubModel()
    var away: ClubModel? = ClubModel()
    var time: String? = ""
    
    
    // MARK:- Constructors
    
    override init() {
        super.init()
    }
    
    init(id: Int, home: ClubModel, away: ClubModel, time: String, created: String = "") {
        super.init(id: id, created: created)
        self.home = home
        self.away = away
        self.time = time
    }
    
    // Decoding
    required init (from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container =  try decoder.container (keyedBy: CodingKeys.self)
        home = try container.decodeIfPresent (ClubModel.self, forKey: .home)
        away = try container.decodeIfPresent (ClubModel.self, forKey: .away)
        time = try container.decodeIfPresent (String.self, forKey: .time)
    }
    
    // Encoding
    override func encode (to encoder: Encoder) throws {
        try super.encode(to: encoder)
        
        // Add specification for model
        var container = encoder.container (keyedBy: CodingKeys.self)
        try container.encodeIfPresent (home, forKey: .home)
        try container.encodeIfPresent (away, forKey: .away)
        try container.encodeIfPresent (time, forKey: .time)
    }
    
    // Hashable
    override func hash(into hasher: inout Hasher) {
        super.hash(into: &hasher)
        
        // Hash specification for model
        hasher.combine(home)
        hasher.combine(away)
        hasher.combine(time)
    }
    
    // CodingKeys for properties
    enum CodingKeys: String, CodingKey {
        
        // Info
        case home = "home"
        case away = "away"
        case time = "time"
    }
}
