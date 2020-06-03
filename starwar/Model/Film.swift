//
//  Film.swift
//  starwar
//
//  Created by seintsan on 3/6/20.
//  Copyright © 2020 seintsan. All rights reserved.
//

import Foundation

struct Film : Decodable {
    var title : String
    var episode_id : Int
    var opening_crawl : String
    var director : String
    var producer : String
    var release_date : String
    var characters : [String]
    var planets : [String]
    var starships:[String]
    var vehicles :[String]
    var species : [String]
    var url :String
}
