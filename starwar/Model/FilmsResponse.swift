//
//  FilmsResponse.swift
//  starwar
//
//  Created by seintsan on 3/6/20.
//  Copyright © 2020 seintsan. All rights reserved.
//

import Foundation

struct FilmsResponse : Decodable{
    var count : Int
    var next : String?
    var previous : String?
    var results : [Film]
}
