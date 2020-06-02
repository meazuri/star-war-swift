//
//  PlanetsResponse.swift
//  starwar
//
//  Created by seintsan on 2/6/20.
//  Copyright © 2020 seintsan. All rights reserved.
//

import Foundation

struct PlanetsResponse : Decodable{
    var count : Int
    var next : String?
    var previous : String?
    var results : [Planet]
    
    enum CodingKeys : String , CodingKey {
           case count ,next ,previous,results       }
    
    init(from decoder: Decoder) throws {
           let container = try decoder.container(keyedBy: CodingKeys.self)
           
           self.count = try container.decode(Int.self, forKey: .count)
           self.next = try container.decodeIfPresent(String.self, forKey: .next)
           self.previous = try container.decodeIfPresent(String.self, forKey: .previous) ?? nil
           self.results = try container.decode([Planet].self, forKey: .results)
       }
}
