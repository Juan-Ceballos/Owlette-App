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
    
    let votes: [ProVote]
}

struct ProVote: Codable {
    let chamber: String
    let congress: Int
    let session: String
    let bill: ProVoteBill
}

struct ProVoteBill: Codable {
    let title: String
}
