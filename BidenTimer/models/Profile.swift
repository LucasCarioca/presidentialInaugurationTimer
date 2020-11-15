//
//  Profile.swift
//  BidenTimer
//
//  Created by Lucas Desouza on 11/10/20.
//

import Foundation

struct Profile: Decodable, Hashable {
    
    var name: String
    var image: String
    var title: String
    var source: String
}
