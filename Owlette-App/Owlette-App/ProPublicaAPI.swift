//
//  ProPublicaAPI.swift
//  Owlette-App
//
//  Created by Juan ceballos on 9/12/23.
//

import Foundation

struct ProPublicaAPI {
    static let baseURL = URL(string: "https://api.propublica.org/congress/v1/116/house/members.json")!
    
    
    func fetchData() async throws -> Data {
        let url = ProPublicaAPI.baseURL
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        if let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String {
            request.addValue(apiKey, forHTTPHeaderField: "X-API-Key")
        }
        
        let (data, _) = try await URLSession.shared.data(for: request)
        return data
    }
    
}


