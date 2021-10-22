//
//  LegModel.swift
//  Planet365UIKit
//
//  Created by Vladimir Lukic on 20.10.21..
//

import UIKit

class LegModel: BaseModel {

    // MARK:- Properties
    
    // Info
    var fixtures: [GameModel]? = [GameModel]()
    
    // MARK:- Constructors
    
    override init() {
        super.init()
    }
    
    init(id: Int, fixtures: [GameModel], created: String = "") {
        super.init(id: id, created: created)
        self.fixtures = fixtures
    }
    
    // Decoding
    required init (from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container =  try decoder.container (keyedBy: CodingKeys.self)
        fixtures = try container.decodeIfPresent ([GameModel].self, forKey: .fixtures)
    }
    
    // Encoding
    override func encode (to encoder: Encoder) throws {
        try super.encode(to: encoder)
        
        // Add specification for model
        var container = encoder.container (keyedBy: CodingKeys.self)
        try container.encodeIfPresent (fixtures, forKey: .fixtures)
    }
    
    // Hashable
    override func hash(into hasher: inout Hasher) {
        super.hash(into: &hasher)
        
        // Hash specification for model
        hasher.combine(fixtures)
    }
    
    // CodingKeys for properties
    enum CodingKeys: String, CodingKey {
        
        // Info
        case fixtures = "fixtures"
    }
}
