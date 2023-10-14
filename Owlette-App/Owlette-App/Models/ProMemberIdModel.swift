//
//  ProMemberIdModel.swift
//  Owlette-App
//
//  Created by Juan ceballos on 10/14/23.
//

import Foundation

struct ProMemberIdModel: Codable {
    let results: [ProMemberId]
}

struct ProMemberId: Codable {
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case url
    }
}
