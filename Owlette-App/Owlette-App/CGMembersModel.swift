//
//  CGMembersModel.swift
//  Owlette-App
//
//  Created by Juan ceballos on 9/18/23.
//

import Foundation

struct CGMember: Codable {
    let members: [Member2]
}

struct Member2: Codable {
    let name: String
}
