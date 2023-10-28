//
//  VotesModel.swift
//  Owlette-App
//
//  Created by Juan ceballos on 9/14/23.
//

import Foundation

struct ProVotesContainer: Codable {
    let results: [ProVotesModel]
}

struct ProVotesModel: Codable {
    let votes: [ProVote]
}

struct ProVote: Codable {
    let bill: ProVoteBill
    let position: String
}

struct ProVoteBill: Codable {
    let number: String
    let title: String?
}
