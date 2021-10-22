//
//  SportModel.swift
//  Planet365UIKit
//
//  Created by Vladimir Lukic on 20.10.21..
//

import UIKit

class SportModel: BaseModel {

    // MARK:- Properties
    
    // Info
    var name: String? = ""
    
    // MARK:- Constructors
    
    override init() {
        super.init()
    }
    
    init(id: Int, name: String, created: String = "") {
        super.init(id: id, created: created)
        self.name = name
    }
    
    // Decoding
    required init (from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container =  try decoder.container (keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent (String.self, forKey: .name)
    }
    
    // Encoding
    override func encode (to encoder: Encoder) throws {
        try super.encode(to: encoder)
        
        // Add specification for model
        var container = encoder.container (keyedBy: CodingKeys.self)
        try container.encodeIfPresent (name, forKey: .name)
    }
    
    // Hashable
    override func hash(into hasher: inout Hasher) {
        super.hash(into: &hasher)
        
        // Hash specification for model
        hasher.combine(name)
    }
    
    // CodingKeys for properties
    enum CodingKeys: String, CodingKey {
        
        // Info
        case name = "name"
    }
}
