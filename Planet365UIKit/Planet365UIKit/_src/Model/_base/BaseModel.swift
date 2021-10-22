//
//  BaseModel.swift
//  Planet365UIKit
//
//  Created by Vladimir Lukic on 20.10.21..
//

import UIKit

class BaseModel: Codable, Hashable {

    // MARK:- Properties
    
    // Meta
    var id: Int? = -1
    var created: String? = ""
    
    // MARK:- Constructors
    
    init() { }
    
    init(id: Int, created: String = "") {
        self.id = id
        self.created = created
    }
    
    // Decoding
    required init (from decoder: Decoder) throws {
        // try super.init(from: decoder)
        
        let container =  try decoder.container (keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent (Int.self, forKey: .id)
        created = try container.decodeIfPresent (String.self, forKey: .created)
    }
    
    // Encoding
    func encode (to encoder: Encoder) throws {
        // try super.encode(to: encoder)
        
        // Add specification for model
        var container = encoder.container (keyedBy: CodingKeys.self)
        try container.encodeIfPresent (id, forKey: .id)
        try container.encodeIfPresent (created, forKey: .created)
    }
    
    // Hashable
    func hash(into hasher: inout Hasher) {
        // super.hash(into: &hasher)
        
        // Hash specification for model
        hasher.combine(id)
        hasher.combine(created)
    }
    
    // Equaleablility :D
    static func == (lhs: BaseModel, rhs: BaseModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    // CodingKeys for properties
    enum CodingKeys: String, CodingKey {
        
        // Meta
        case id = "id"
        case created = "created"
    }
}
