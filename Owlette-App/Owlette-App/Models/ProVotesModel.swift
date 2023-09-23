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
    let numResults: Int
    let votes: [ProVote]
    
    enum CodingKeys: String, CodingKey {
        case numResults = "num_results"
        case votes
    }
}

struct ProVote: Codable {
    let congress: Int
    let chamber: String
}
