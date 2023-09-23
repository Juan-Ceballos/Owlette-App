//
//  ProMembersStateHouseModel.swift
//  Owlette-App
//
//  Created by Juan ceballos on 9/23/23.
//

import Foundation

struct ProMembersStateModel: Codable {
    let results: [ProMembersState]
}

struct ProMembersState: Codable {
    let id: String
    let name: String
    let role: String
}
