//
//  Owlette_AppTests.swift
//  Owlette-AppTests
//
//  Created by Juan ceballos on 9/12/23.
//

import XCTest
@testable import Owlette_App

final class Owlette_AppTests: XCTestCase {
    
    func testProPublicaAPIFetchMemberData() async {
        let exp = XCTestExpectation(description: "Fetched data")
        let baseURL = ProPublicaAPI.baseURL
        let expectedDataCount = 1000
        
        Task {
            do {
                let url = baseURL.appendingPathComponent("116/house/members.json")
                var request = URLRequest(url: url)
                request.httpMethod = "GET"
                if let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String {
                    request.addValue(apiKey, forHTTPHeaderField: "X-API-Key")
                }
                
                let (data, _) = try await URLSession.shared.data(for: request)
                XCTAssertGreaterThan(data.count, expectedDataCount, "Data fetched count \(data.count) is greater than the minimum expected data count \(expectedDataCount)")
                exp.fulfill()
            } catch {
                XCTFail("\(error)")
            }
        }
        
        await fulfillment(of: [exp], timeout: 10.0)
    }

    func testProPublicaAPIFetchParseDataMembers() async {
        let exp = XCTestExpectation(description: "Members data fetched and parsed")
        let proAPI = ProPublicaAPI()
        let expectedMemberCount = 50
        
        Task {
            do {
                let members = try await proAPI.fetchParseData(pathComponent: "116/house/members.json", responseType: ProMembersModel.self)
                let memberResultsCount = members.results.first?.numResults ?? 0
                XCTAssertGreaterThan(memberResultsCount, expectedMemberCount, "The members count of \(memberResultsCount) is not greater than the expected minimum members count of \(expectedMemberCount)")
                exp.fulfill()
            } catch {
                XCTFail("failed to fetch and/or parse member data due to error: \(error)")
            }
        }
        
        await fulfillment(of: [exp], timeout: 10.0)
    }
    
    func testProPublicaAPIFetchBillsData() async {
        let exp = XCTestExpectation(description: "Fetched data")
        let baseURL = ProPublicaAPI.baseURL
        let expectedDataCount = 1000
        
        Task {
            do {
                let url = baseURL.appendingPathComponent("115/house/bills/introduced.json")
                var request = URLRequest(url: url)
                request.httpMethod = "GET"
                if let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String {
                    request.addValue(apiKey, forHTTPHeaderField: "X-API-Key")
                }
                
                let (data, _) = try await URLSession.shared.data(for: request)
                XCTAssertGreaterThan(data.count, expectedDataCount, "data fetched count \(data.count) is greater than the minimum expected data count \(expectedDataCount)")
                exp.fulfill()
            } catch {
                XCTFail("\(error)")
            }
        }
        
        await fulfillment(of: [exp], timeout: 15.0)
    }
    
    func testProPublicaAPIFetchParseDataBills() async {
        let exp = XCTestExpectation(description: "Recent twenty bills data fetched and parsed")
        let proAPI = ProPublicaAPI()
        let expectedBillsCount = 20
        
        Task {
            do {
                let bills = try await proAPI.fetchParseData(pathComponent: "115/house/bills/introduced.json", responseType: ProBillsModel.self)
                let billsResultCount = bills.results.first?.numResults ?? 0
                XCTAssertEqual(expectedBillsCount, billsResultCount, "Count of the expected \(expectedBillsCount) recent bills does not equal to the fetched \(billsResultCount) recent bills")
                exp.fulfill()
            } catch {
                XCTFail("failed to fetch and/or parse bills data due to error: \(error)")
            }
        }
        
        await fulfillment(of: [exp], timeout: 15.0)
    }
    
    func testProPublicaAPIFetchVotesData() async {
        let exp = XCTestExpectation(description: "Fetched data")
        let baseURL = ProPublicaAPI.baseURL
        let expectedDataCount = 1000
        
        Task {
            do {
                let url = baseURL.appendingPathComponent("house/votes/recent.json")
                var request = URLRequest(url: url)
                request.httpMethod = "GET"
                if let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String {
                    request.addValue(apiKey, forHTTPHeaderField: "X-API-Key")
                }
                
                let (data, _) = try await URLSession.shared.data(for: request)
                XCTAssertGreaterThan(data.count, expectedDataCount, "data fetched count \(data.count) is greater than the minimum expected data count \(expectedDataCount)")
                exp.fulfill()
            } catch {
                XCTFail("\(error)")
            }
        }
        
        await fulfillment(of: [exp], timeout: 10.0)
    }
    
    func testProPublicaAPIFetchParseDataVotes() async {
        let exp = XCTestExpectation(description: "Votes data fetched and parsed")
        let proAPI = ProPublicaAPI()
        let expectedVotesCount = 20
        
        Task {
            do {
                let votes = try await proAPI.fetchParseData(pathComponent: "house/votes/recent.json", responseType: ProVotesModel.self)
                let votesResultCount = votes.results.numResults
                XCTAssertEqual(expectedVotesCount, votesResultCount, "Count of the expected \(expectedVotesCount) recent votes does not equal to the fetched \(votesResultCount) recent votes count")
                exp.fulfill()
            } catch {
                XCTFail("failed to fetch and/or parse votes data due to error: \(error)")
            }
        }
        
        await fulfillment(of: [exp], timeout: 10.0)
    }
    
    func testCongressGovAPIfetchMemberData() async {
        let exp = XCTestExpectation(description: "Fetched data")
        let expectedDataCount = 1000
        
        Task {
            do {
                let apiKey2 = Bundle.main.infoDictionary?["API_KEY2"] as? String
                
                let url = URL(string: "https://api.congress.gov/v3/member/L000174?api_key=\(apiKey2 ?? "Key Not Attained")")!
                var request = URLRequest(url: url)
                request.httpMethod = "GET"
                let (data, _) = try await URLSession.shared.data(for: request)
                XCTAssertGreaterThan(data.count, expectedDataCount, "data fetched count \(data.count) is greater than the minimum expected data count \(expectedDataCount)")
                exp.fulfill()
            } catch {
                XCTFail("\(error)")
            }
        }
        
        await fulfillment(of: [exp], timeout: 10.0)
    }
    
    func testCongressGovAPIfetchParseCGMemberModel() async {
        let exp = XCTestExpectation(description: "fetched")
        let congresGOVAPI = CongressGovAPI()
        let expectedMemberFN = "Patrick"
        
        Task {
            do {
                let member = try await congresGOVAPI.fetchParseCGMemberModel(memberId: "L000174")
                let memberFN = member.member.firstName
                
                XCTAssertEqual(expectedMemberFN, memberFN, "expected name \(expectedMemberFN) does not equal to the fetched name \(memberFN)")
                exp.fulfill()
                
            } catch {
                XCTFail("failed to fetch and/or parse due to: \(error)")
            }
        }
        
        await fulfillment(of: [exp], timeout: 12.0)
    }
    
    func testProPublicaAPIFetchVotesData2() async {
        let exp = XCTestExpectation(description: "Fetched data")
        let baseURL = ProPublicaAPI.baseURL
        let expectedDataCount = 1000
        
        Task {
            do {
                let url = baseURL.appendingPathComponent("members/house/CA/current.json")
                var request = URLRequest(url: url)
                request.httpMethod = "GET"
                if let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String {
                    request.addValue(apiKey, forHTTPHeaderField: "X-API-Key")
                }
                
                let (data, _) = try await URLSession.shared.data(for: request)
                XCTAssertGreaterThan(data.count, expectedDataCount, "data fetched count \(data.count) is greater than the minimum expected data count \(expectedDataCount)")
                exp.fulfill()
            } catch {
                XCTFail("\(error)")
            }
        }
        
        await fulfillment(of: [exp], timeout: 10.0)
    }
    
    func testProPublicaFetchMemberState() async {
        let exp = XCTestExpectation(description: "Fecthed Member based on state")
        let proApi = ProPublicaAPI()
        let expectedMemberCount = 52
        
        Task {
            do {
                let members = try await proApi.fetchParseData(pathComponent: "members/house/CA/current.json", responseType: ProMembersStateModel.self)
                let membersInStateCount = members.results.count
                XCTAssertEqual(membersInStateCount, expectedMemberCount)
                exp.fulfill()
            } catch {
                XCTFail("Failed to fetch and or parse member due to error: \(error)")
            }
        }
        
        await fulfillment(of: [exp], timeout: 12.0)
    }
    
    func setup() {
        UserDefaults.standard.removeObject(forKey: "state")
    }
    
    override func tearDown() {
        UserDefaults.standard.removeObject(forKey: "state")
    }
    
    func testUserDefaultsSaveSearchedState() {
        let exp = XCTestExpectation(description: "UserDefaults saved and retrieved string")
        let expectedStr = "NY"
        UserDefaultsManager.shared.saveSearchedState("NY")
        let storedStateText = UserDefaultsManager.shared.getSearchedState() ?? "Nothing"
        
        XCTAssertEqual(expectedStr, storedStateText)

    }
    
}
