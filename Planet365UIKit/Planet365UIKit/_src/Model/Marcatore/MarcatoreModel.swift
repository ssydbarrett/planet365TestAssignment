//
//  MarcatoreModel.swift
//  Planet365UIKit
//
//  Created by Vladimir Lukic on 20.10.21..
//

import UIKit

class MarcatoreModel: BaseModel {

    // MARK:- Properties
    
    // Info
    var _1: Float? = 0.0
    var _x: Float? = 0.0
    var _2: Float? = 0.0
    var player: PlayerModel? = PlayerModel()
    
    // MARK:- Constructors
    
    override init() {
        super.init()
    }
    
    init(id: Int, _1: Float, _x: Float, _2: Float, player: PlayerModel, created: String = "") {
        super.init(id: id, created: created)
        self._1 = _1
        self._x = _x
        self._2 = _2
        self.player = player
    }
    
    // Decoding
    required init (from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container =  try decoder.container (keyedBy: CodingKeys.self)
        _1 = try container.decodeIfPresent (Float.self, forKey: ._1)
        _x = try container.decodeIfPresent (Float.self, forKey: ._x)
        _2 = try container.decodeIfPresent (Float.self, forKey: ._2)
        player = try container.decodeIfPresent (PlayerModel.self, forKey: .player)
    }
    
    // Encoding
    override func encode (to encoder: Encoder) throws {
        try super.encode(to: encoder)
        
        // Add specification for  model
        var container = encoder.container (keyedBy: CodingKeys.self)
        try container.encodeIfPresent (_1, forKey: ._1)
        try container.encodeIfPresent (_x, forKey: ._x)
        try container.encodeIfPresent (_2, forKey: ._2)
        try container.encodeIfPresent (player, forKey: .player)
    }
    
    // Hashable
    override func hash(into hasher: inout Hasher) {
        super.hash(into: &hasher)
        
        // Hash specification for model
        hasher.combine(_1)
        hasher.combine(_x)
        hasher.combine(_2)
        hasher.combine(player)
    }
    
    // CodingKeys for properties
    enum CodingKeys: String, CodingKey {
        
        // Info
        case _1 = "_1"
        case _x = "_x"
        case _2 = "_2"
        case player = "player"
    }
}
