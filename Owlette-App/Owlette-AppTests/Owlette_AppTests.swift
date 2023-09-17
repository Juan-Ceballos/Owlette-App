//
//  Owlette_AppTests.swift
//  Owlette-AppTests
//
//  Created by Juan ceballos on 9/12/23.
//

import XCTest
@testable import Owlette_App

final class Owlette_AppTests: XCTestCase {

    func testProPublicaAPIFetchParseDataMembers() async {
        let exp = XCTestExpectation(description: "Members data fetched")
        let proAPI = ProPublicaAPI()
        let expectedMemberCount = 50
        
        Task {
            do {
                let members = try await proAPI.fetchParseData(pathComponent: "116/house/members.json", responseType: MembersModel.self)
                let memberResultsCount = members.results.first?.num_results ?? 0
                XCTAssertGreaterThan(memberResultsCount, expectedMemberCount, "The members count of \(memberResultsCount) is not greater than the expected minimum members count of \(expectedMemberCount)")
                exp.fulfill()
            } catch {
                XCTFail("failed to fetch and/or parse member data due to error: \(error)")
            }
        }
        
        await fulfillment(of: [exp], timeout: 10.0)
    }
    
    func testProPublicaAPIFetchParseDataBills() async {
        let exp = XCTestExpectation(description: "Recent twenty bills data fetched and parsed")
        let proAPI = ProPublicaAPI()
        let expectedBillsCount = 20
        
        Task {
            do {
                let bills = try await proAPI.fetchParseData(pathComponent: "115/house/bills/introduced.json", responseType: BillsModel.self)
                let billsResultCount = bills.results.first?.num_results ?? 0
                XCTAssertEqual(expectedBillsCount, billsResultCount)
                exp.fulfill()
            } catch {
                XCTFail("failed to fetch and/or parse bills data due to error: \(error)")
            }
        }
        
        await fulfillment(of: [exp], timeout: 10.0)
    }
    
    func testProPublicaAPIFetchParseDataVotes() async {
        let exp = XCTestExpectation(description: "fill here")
        let proAPI = ProPublicaAPI()
        let expectedVotesCount = 1
        
        Task {
            do {
                let votes = try await proAPI.fetchParseData(pathComponent: "", responseType: VotesModel.self)
                let votesResultCount = votes.results
            }
        }
    }
    
}
