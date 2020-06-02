//
//  Planet.swift
//  starwar
//
//  Created by seintsan on 2/6/20.
//  Copyright © 2020 seintsan. All rights reserved.
//

import Foundation

struct Planet : Encodable {
    var climate :String?
    var diameter : String?
    var films : [String]
    var gravity : String?
    var name : String?
    var population : String
    var residents : [String]
    var url : String?
    
    enum CodingKeys : String , CodingKey {
        case climate, diameter, films,gravity,name,population,residents,url
    }
    
    func encode(to encoder : Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(climate, forKey: .climate)
        try container.encode(diameter, forKey: .diameter)
        try container.encodeIfPresent(films, forKey: .films)
        try container.encodeIfPresent(url, forKey: .url)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(population, forKey: .population)
        try container.encodeIfPresent(residents, forKey: .residents)

    }
    
}

extension Planet : Decodable {
    
    init(from decoder : Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.climate = try container.decode(String.self, forKey: .climate)
        self.diameter = try container.decode(String.self, forKey: .diameter)
        self.films = try container.decode([String].self, forKey: .films)
        self.url = try container.decode(String.self, forKey: .url)
        self.name = try container.decode(String.self, forKey: .name)
        self.population = try container.decode(String.self, forKey: .population)
        self.residents = try container.decode([String].self, forKey: .residents)
    }
}
