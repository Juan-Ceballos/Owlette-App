//
//  VotesModel.swift
//  Owlette-App
//
//  Created by Juan ceballos on 9/14/23.
//

import Foundation

struct VotesModel: Codable {
    let results: VotesContainer
}

struct VotesContainer: Codable {
    let num_results: Int
    let votes: [Vote]
}

struct Vote: Codable {
    let congress: Int
    let chamber: String
}
