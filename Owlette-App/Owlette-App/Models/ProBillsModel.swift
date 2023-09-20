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
    let num_results: Int
    let offset: Int
    let bills: [ProBill]
}

struct ProBill: Codable {
    let bill_id: String
    let title: String
}
