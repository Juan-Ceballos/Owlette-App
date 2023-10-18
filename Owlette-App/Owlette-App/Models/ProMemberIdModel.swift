//
//  ProMemberIdModel.swift
//  Owlette-App
//
//  Created by Juan ceballos on 10/14/23.
//

import Foundation

struct MemberIdModelContainer: Codable {
    let results: [MemberIdModel]
}

struct MemberIdModel: Codable {
    let url: String
}
