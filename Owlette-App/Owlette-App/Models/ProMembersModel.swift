//
//  MembersModel.swift
//  Owlette-App
//
//  Created by Juan ceballos on 9/14/23.
//

import Foundation

struct ProMembersModel: Codable {
    let results: [ProMembersContainer]
}

struct ProMembersContainer: Codable {
    let congress: String
    let chamber: String
    let numResults: Int
    let members: [ProMember]
    
    private enum CodingKeys: String, CodingKey {
        case congress
        case chamber
        case numResults = "num_results"
        case members
    }
}

struct ProMember: Codable {
    let firstName: String
    let lastName: String
    let gender: String
    let party: String
    let inOffice: Bool
    
    private enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case gender
        case party
        case inOffice = "in_office"
    }
}


