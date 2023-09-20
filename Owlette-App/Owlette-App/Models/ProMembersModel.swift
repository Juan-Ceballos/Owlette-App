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
    let num_results: Int
    let members: [ProMember]
}

struct ProMember: Codable {
    let first_name: String
    let last_name: String
    let gender: String
    let party: String
    let in_office: Bool
}


