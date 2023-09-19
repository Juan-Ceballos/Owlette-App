//
//  CongressGovAPI.swift
//  Owlette-App
//
//  Created by Juan ceballos on 9/18/23.
//

import Foundation

struct CongressGovAPI {
    
    func fetchParseData() async throws -> Data? {
        var request: URLRequest
        if let apiKey2 = Bundle.main.infoDictionary?["API_KEY2"] as? String {
            let url = URL(string: "https://api.congress.gov/v3/member?api_key=\(apiKey2)")!
            print("juan: \(url)")
            request = URLRequest(url: url)
            request.httpMethod = "GET"
            let (data, _) = try await URLSession.shared.data(for: request)
            
            return data
        }
        return nil
    }
    
}


