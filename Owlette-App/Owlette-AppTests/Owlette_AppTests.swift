//
//  Owlette_AppTests.swift
//  Owlette-AppTests
//
//  Created by Juan ceballos on 9/12/23.
//

import XCTest
@testable import Owlette_App

final class Owlette_AppTests: XCTestCase {

    func testProPublicaAPI() async {
        let exp = XCTestExpectation(description: "data fetched")
        let proAPI = ProPublicaAPI()
        let expectedDataCount = 100000
        
        Task {
            do {
                let data = try await proAPI.fetchData()
                let dataCount = data.count
                XCTAssertGreaterThan(dataCount, expectedDataCount, "The Data count of \(dataCount) is greater than the expected minimum data count of \(expectedDataCount)")
                exp.fulfill()
            } catch {
                XCTFail("sorry \(error)")
            }
        }
        
        await fulfillment(of: [exp], timeout: 5.0)
    }
    
}
