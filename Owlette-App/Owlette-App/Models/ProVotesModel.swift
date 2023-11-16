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
    let totalVotes: String?
    let votes: [ProVote]
    
    enum CodingKeys: String, CodingKey {
        case totalVotes = "total_votes"
        case votes
    }
}

struct ProVote: Codable {
    let rollCall: String
    let bill: ProVoteBill
    let description: String
    let question : String
    let result: String
    let date: String
    let time: String
    let total: ProTotal
    let position: String
    
    enum CodingKeys: String, CodingKey {
        case rollCall = "roll_call"
        case bill
        case description
        case question
        case result
        case date
        case time
        case total
        case position
    }
    
}

struct ProVoteBill: Codable {
    let number: String
    let title: String?
    let latestAction: String
    
    enum CodingKeys: String, CodingKey {
        case number
        case title
        case latestAction = "latest_action"
    }
}

struct ProTotal: Codable {
    let yes: Int
    let no: Int
    let present: Int
    let notVoting: Int
    
    enum CodingKeys: String, CodingKey {
        case yes
        case no
        case present
        case notVoting = "not_voting"
    }
}
