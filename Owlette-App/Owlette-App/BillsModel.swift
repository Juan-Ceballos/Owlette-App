//
//  BillsModel.swift
//  Owlette-App
//
//  Created by Juan ceballos on 9/14/23.
//

import Foundation

struct BillsModel: Codable {
    let results: [BillsContainer]
}

struct BillsContainer: Codable {
    let congress: Int
    let chamber: String
    let num_results: Int
    let offset: Int
    let bills: [Bill]
}

struct Bill: Codable {
    let bill_id: String
    let title: String
}
