//
//  MembersModel.swift
//  Owlette-App
//
//  Created by Juan ceballos on 9/14/23.
//

import Foundation

struct MembersModel: Codable {
    let results: [MembersContainer]
}

struct MembersContainer: Codable {
    let congress: String
    let chamber: String
    let num_results: Int
    let members: [Member]
}

struct Member: Codable {
    let first_name: String
    let last_name: String
    let gender: String
    let party: String
    let in_office: Bool
}


