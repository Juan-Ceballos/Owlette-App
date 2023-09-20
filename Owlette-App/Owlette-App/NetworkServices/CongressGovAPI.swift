//
//  CongressGovAPI.swift
//  Owlette-App
//
//  Created by Juan ceballos on 9/18/23.
//

import Foundation

struct CongressGovAPI {
    
    func fetchParseCGMemberModel(memberId: String) async throws -> CGMembersModel {
        let apiKey2 = Bundle.main.infoDictionary?["API_KEY2"] as? String
        
        let url = URL(string: "https://api.congress.gov/v3/member/\(memberId)?api_key=\(apiKey2 ?? "Key Not Attained")")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let (data, _) = try await URLSession.shared.data(for: request)
        let decoder = JSONDecoder()
        
        return try decoder.decode(CGMembersModel.self, from: data)
    }
    
}


