//
//  CGMembersModel.swift
//  Owlette-App
//
//  Created by Juan ceballos on 9/18/23.
//

import Foundation

struct CGMembersModel: Codable {
    let member: CGMember
}

struct CGMember: Codable {
    let bioguideId: String
    let depiction: Depiction
    let directOrderName: String
    let partyHistory: PartyHistory
    let state: String
}

struct Depiction: Codable {
    let attribution: String
    let imageUrl: String
}

struct PartyHistory: Codable {
    let partyAbbreviation: String
    let partyName: String
    let startYear: Int
}
