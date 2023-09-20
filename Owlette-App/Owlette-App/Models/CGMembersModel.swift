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
    let firstName: String
}
