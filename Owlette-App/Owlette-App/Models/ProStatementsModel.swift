//
//  ProStatementsModel.swift
//  Owlette-App
//
//  Created by Juan ceballos on 11/22/23.
//

import Foundation

struct ProStatementsContainer: Codable {
    let results: [ProStatement]
}

struct ProStatement: Codable {
    let url: String
    let date: String
    let title: String
    let statementType: String
    let memberId: String
    let name: String
    let chamber: String
    let state: String
    let party: String
    
    private enum CodingKeys: String, CodingKey {
        case url
        case date
        case title
        case statementType = "statement_type"
        case memberId = "member_id"
        case name
        case chamber
        case state
        case party
    }
}
