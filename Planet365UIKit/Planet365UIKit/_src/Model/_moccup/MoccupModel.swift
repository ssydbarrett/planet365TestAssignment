//
//  MoccupModel.swift
//  Planet365UIKit
//
//  Created by Vladimir Lukic on 20.10.21..
//

import UIKit

class MoccupModel: NSObject {

    // SPORTS
    static let SPORT_SOCCER = SportModel(id: 1, name: "Soccer")
    static let SPORT_BASKETBALL = SportModel(id: 2, name: "Basketball")
    static let SPORT_NFL = SportModel(id: 3, name: "NFL")
    
    // LEAGUES
    static let LEAGUE_SERIE_A = LeagueModel(id: 1, name: "Italia - Serie A", country: "it", rank: 1, sport: SPORT_SOCCER)
    static let LEAGUE_SERIE_B = LeagueModel(id: 2, name: "Italia - Serie B", country: "it", rank: 2, sport: SPORT_SOCCER)
    static let PREMIER_LEAGUE = LeagueModel(id: 3, name: "England - Premier League", country: "en", rank: 1, sport: SPORT_SOCCER)
    
    // CLUBS
    static let CLUB_SASSUOLO = ClubModel(id: 1, name: "Sassuolo Calcio", league: LEAGUE_SERIE_A)
    static let CLUB_CAGLIARI = ClubModel(id: 2, name: "Cagliari Calcio", league: LEAGUE_SERIE_A)
    
    // GAMES
    static let GAME_1 = GameModel(id: 1, home: CLUB_CAGLIARI, away: CLUB_SASSUOLO, time: "16-11-2021 18:00:00")
    // dd-MM-yyyy HH:mm:ss
    
    // SCHEDULE
    static let LEG_13 = LegModel(id: 1, fixtures: [GAME_1])
    static let SCHEDULE_SERIE_A = ScheduleModel(id: 1, legs: [LEG_13], league: LEAGUE_SERIE_A)
    
    // PLAYERS
    
    static let PLAYER_CAGLIARI_1 = PlayerModel(id: 1, name: "João Pedro", position: "FW", age: 29, club: CLUB_CAGLIARI)
    static let PLAYER_CAGLIARI_2 = PlayerModel(id: 2, name: "Razvan Marin", position: "RMC", age: 25, club: CLUB_CAGLIARI)
    static let PLAYER_CAGLIARI_3 = PlayerModel(id: 3, name: "Andrea Carboni", position: "DC", age: 21, club: CLUB_CAGLIARI)
    static let PLAYER_CAGLIARI_4 = PlayerModel(id: 4, name: "Alessandro Deiola", position: "LMC", age: 26, club: CLUB_CAGLIARI)
    static let PLAYER_CAGLIARI_5 = PlayerModel(id: 5, name: "Dalbert", position: "LB", age: 28, club: CLUB_CAGLIARI)
    static let PLAYER_CAGLIARI_6 = PlayerModel(id: 6, name: "Keita Baldé", position: "FW", age: 27, club: CLUB_CAGLIARI)
    
    static let PLAYER_SASSUOLO_1 = PlayerModel(id: 7, name: "Gianmarco Ferrari", position: "CD", age: 30, club: CLUB_SASSUOLO)
    static let PLAYER_SASSUOLO_2 = PlayerModel(id: 8, name: "Davide Frattesi", position: "MC", age: 22, club: CLUB_SASSUOLO)
    static let PLAYER_SASSUOLO_3 = PlayerModel(id: 9, name: "Jérémie Boga", position: "AMC", age: 25, club: CLUB_SASSUOLO)
    static let PLAYER_SASSUOLO_4 = PlayerModel(id: 10, name: "Filip Đuričić", position: "AMC", age: 30, club: CLUB_SASSUOLO)
    static let PLAYER_SASSUOLO_5 = PlayerModel(id: 11, name: "Maxime López", position: "RMC", age: 24, club: CLUB_SASSUOLO)
    static let PLAYER_SASSUOLO_6 = PlayerModel(id: 12, name: "Domenico Berardi", position: "FW", age: 35, club: CLUB_SASSUOLO)

    // MARCATORE - random kvote (:
    
    static let MARCATORE_1 = MarcatoreModel(id: 1, _1: 2.14, _x: 4.18, _2: 7.00, player: PLAYER_CAGLIARI_1)
    static let MARCATORE_2 = MarcatoreModel(id: 2, _1: 3.51, _x: 6.11, _2: 9.87, player: PLAYER_CAGLIARI_2)
    static let MARCATORE_3 = MarcatoreModel(id: 3, _1: 6.24, _x: 9.66, _2: 10.90, player: PLAYER_CAGLIARI_3)
    static let MARCATORE_4 = MarcatoreModel(id: 4, _1: 4.56, _x: 7.18, _2: 0.00, player: PLAYER_CAGLIARI_4)
    static let MARCATORE_5 = MarcatoreModel(id: 5, _1: 4.67, _x: 8.34, _2: 11.39, player: PLAYER_CAGLIARI_5)
    static let MARCATORE_6 = MarcatoreModel(id: 6, _1: 3.07, _x: 6.50, _2: 8.87, player: PLAYER_CAGLIARI_6)
    static let MARCATORE_7 = MarcatoreModel(id: 7, _1: 14.74, _x: 10.06, _2: 5.86, player: PLAYER_SASSUOLO_1)
    static let MARCATORE_8 = MarcatoreModel(id: 8, _1: 12.55, _x: 9.31, _2: 5.23, player: PLAYER_SASSUOLO_2)
    static let MARCATORE_9 = MarcatoreModel(id: 9, _1: 0.00, _x: 8.89, _2: 4.76, player: PLAYER_SASSUOLO_3)
    static let MARCATORE_10 = MarcatoreModel(id: 10, _1: 10.22, _x: 8.16, _2: 3.90, player: PLAYER_SASSUOLO_4)
    static let MARCATORE_11 = MarcatoreModel(id: 11, _1: 11.63, _x: 7.68, _2: 3.31, player: PLAYER_SASSUOLO_5)
    static let MARCATORE_12 = MarcatoreModel(id: 12, _1: 9.45, _x: 6.74, _2: 2.87, player: PLAYER_SASSUOLO_6)
    
    // MOCCED API MODEL
    
    static let API_MODEL: [String : Any] = [
    
        "league": LEAGUE_SERIE_A,
        "time": GAME_1.time ?? "16-11-2021 18:00:00",
        "games": [GAME_1],
        "marcatore": [ MARCATORE_1, MARCATORE_2, MARCATORE_3, MARCATORE_4, MARCATORE_5, MARCATORE_6, MARCATORE_7, MARCATORE_8, MARCATORE_9, MARCATORE_10, MARCATORE_11, MARCATORE_12]
        
    ]
    
    static let API_RESPONSE: [String : Any] = [
    
        "data": [API_MODEL]
        
    ]
}

class MoccupAPIModel: BaseModel {

    // MARK:- Properties
    
    // Info
    var league: LeagueModel? = LeagueModel()
    var time: String? = ""
    var games: [GameModel]? = [GameModel]()
    var marcatoreArray: [MarcatoreModel]? = [MarcatoreModel]()
    
    // MARK:- Constructors
    
    override init() {
        super.init()
    }
    
    init(id: Int, league: LeagueModel, time: String, games: [GameModel], marcatoreArray: [MarcatoreModel], created: String = "") {
        super.init(id: id, created: created)
        self.league = league
        self.time = time
        self.games = games
        self.marcatoreArray = marcatoreArray
    }
    
    // Decoding
    required init (from decoder: Decoder) throws {
        try super.init(from: decoder)
        
        let container =  try decoder.container (keyedBy: CodingKeys.self)
        league = try container.decodeIfPresent (LeagueModel.self, forKey: .league)
        time = try container.decodeIfPresent (String.self, forKey: .time)
        games = try container.decodeIfPresent ([GameModel].self, forKey: .games)
        marcatoreArray = try container.decodeIfPresent ([MarcatoreModel].self, forKey: .marcatoreArray)
    }
    
    // Encoding
    override func encode (to encoder: Encoder) throws {
        try super.encode(to: encoder)
        
        // Add specification for model
        var container = encoder.container (keyedBy: CodingKeys.self)
        try container.encodeIfPresent (league, forKey: .league)
        try container.encodeIfPresent (time, forKey: .time)
        try container.encodeIfPresent (games, forKey: .games)
        try container.encodeIfPresent (marcatoreArray, forKey: .marcatoreArray)
    }
    
    // Hashable
    override func hash(into hasher: inout Hasher) {
        super.hash(into: &hasher)
        
        // Hash specification for model
        hasher.combine(league)
        hasher.combine(time)
        hasher.combine(games)
        hasher.combine(marcatoreArray)
    }
    
    // CodingKeys for properties
    enum CodingKeys: String, CodingKey {
        
        // Info
        case league = "league"
        case time = "time"
        case games = "games"
        case marcatoreArray = "marcatore"
    }
}

