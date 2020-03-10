//
//  Movie.swift
//  Movie List
//
//  Created by Bree Jeune on 3/8/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

struct Movie: Codable, Equatable {
    var name: String
    var hasBeenSeen: Bool = false
}
