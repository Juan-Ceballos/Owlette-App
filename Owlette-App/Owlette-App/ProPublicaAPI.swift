//
//  ProPublicaAPI.swift
//  Owlette-App
//
//  Created by Juan ceballos on 9/12/23.
//

import Foundation

struct ProPublicaAPI {
    static let baseURL = URL(string: "https://api.propublica.org/congress/v1/")!
    // 116/house/members.json
    
    func fetchParseData<T: Codable>(pathComponent: String, responseType: T.Type) async throws -> T {
        let apiUrl = ProPublicaAPI.baseURL.appendingPathComponent(pathComponent)
        var request = URLRequest(url: apiUrl)
        request.httpMethod = "GET"
        if let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String {
            request.addValue(apiKey, forHTTPHeaderField: "X-API-Key")
        }
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let decoder = JSONDecoder()
        return try decoder.decode(responseType, from: data)
    }
    
}


