//
//  VotesModel.swift
//  Owlette-App
//
//  Created by Juan ceballos on 9/14/23.
//

import Foundation

struct ProVotesModel: Codable {
    let results: ProVotesContainer
}

struct ProVotesContainer: Codable {
    let num_results: Int
    let votes: [ProVote]
}

struct ProVote: Codable {
    let congress: Int
    let chamber: String
}
