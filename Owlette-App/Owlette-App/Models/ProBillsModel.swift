//
//  BillsModel.swift
//  Owlette-App
//
//  Created by Juan ceballos on 9/14/23.
//

import Foundation

struct ProBillsModel: Codable {
    let results: [ProBillsContainer]
}

struct ProBillsContainer: Codable {
    let congress: Int
    let chamber: String
    let numResults: Int
    let offset: Int
    let bills: [ProBill]
    
    enum CodingKeys: String, CodingKey {
        case congress
        case chamber
        case numResults = "num_results"
        case offset
        case bills
    }
}

struct ProBill: Codable {
    let billId: String
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case billId = "bill_id"
        case title
    }
}
