//
//  PlayerModel.swift
//  Planet365UIKit
//
//  Created by Vladimir Lukic on 20.10.21..
//

import UIKit

class PlayerModel: BaseModel {

    // MARK:- Properties
    
    // Info
    var name: String? = ""
    var position: String? = ""
    var age: Int? = 0
    var club: ClubModel? = ClubModel()
    
    // MARK:- Constructors
    
    override init() {
        super.init()
    }
    
    init(id: Int, name: String, position: String, age: Int, club: ClubModel, created: String = "") {
        super.init(id: id, created: created)
        self.name = name
        self.position = position
        self.age = age
        self.club = club
    }
    
    // Decoding
    required init (from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container =  try decoder.container (keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent (String.self, forKey: .name)
        position = try container.decodeIfPresent (String.self, forKey: .position)
        age = try container.decodeIfPresent (Int.self, forKey: .age)
        club = try container.decodeIfPresent (ClubModel.self, forKey: .club)
    }
    
    // Encoding
    override func encode (to encoder: Encoder) throws {
        try super.encode(to: encoder)
        
        // Add specification for  model
        var container = encoder.container (keyedBy: CodingKeys.self)
        try container.encodeIfPresent (name, forKey: .name)
        try container.encodeIfPresent (position, forKey: .position)
        try container.encodeIfPresent (age, forKey: .age)
        try container.encodeIfPresent (club, forKey: .club)
    }
    
    // Hashable
    override func hash(into hasher: inout Hasher) {
        super.hash(into: &hasher)
        
        // Hash specification for model
        hasher.combine(name)
        hasher.combine(position)
        hasher.combine(age)
        hasher.combine(club)
    }
    
    // CodingKeys for properties
    enum CodingKeys: String, CodingKey {
        
        // Info
        case name = "name"
        case position = "position"
        case age = "age"
        case club = "club"
    }
}
