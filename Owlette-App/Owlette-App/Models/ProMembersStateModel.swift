//
//  ProMembersStateHouseModel.swift
//  Owlette-App
//
//  Created by Juan ceballos on 9/23/23.
//

import Foundation

struct ProMembersStateModel: Codable {
    let results: [ProMemberState]
}

struct ProMemberState: Codable {
    let id: String
    let name: String
    let firstName: String
    let middleName: String?
    let lastName: String
    let role: String
    let party: String
    let twitterId: String?
    let facebookAccount: String?
    let youtubeId: String?
    let seniority: String
    let nextElection: String
    let apiUri: String
    let district: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case firstName = "first_name"
        case middleName = "middle_name"
        case lastName = "last_name"
        case role
        case party
        case twitterId = "twitter_id"
        case facebookAccount = "facebook_account"
        case youtubeId = "youtube_id"
        case seniority
        case nextElection = "next_election"
        case apiUri = "api_uri"
        case district
    }
}
