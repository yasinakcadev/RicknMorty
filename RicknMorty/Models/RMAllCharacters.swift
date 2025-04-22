//
//  RMAllCharacters.swift
//  RicknMorty
//
//  Created by Yasin on 22.04.2025.
//

import Foundation

struct RMAllCharacters: Codable {
    let info: Info?
    let results: [RMCharacter]?
}

struct Info: Codable {
    let count: Int?
    let pages: Int?
    let next: String?
    let prev: String?
}
