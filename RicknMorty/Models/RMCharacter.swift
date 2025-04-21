//
//  RMCharacter.swift
//  RicknMorty
//
//  Created by Yasin on 22.04.2025.
//

struct RMCharacter: Codable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin: RMLocation?
    let location: RMLocation?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

struct RMLocation: Codable {
    let name: String?
    let url: String?
}

