//
//  SharedURLSessionTests.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import Testing
@testable import JobInfo
import Foundation

struct SharedURLSessionTests {

    @Test func test_data_success() async throws {
        // GIVEN
        let url = URL(string: "https://example.com")!
        let request = URLRequest(url: url)
        let sharedSession = SharedURLSession()

        // WHEN
        let (receivedData, receivedResponse) = try await sharedSession.data(for: request)

        // THEN
        #expect(receivedData != nil)
        #expect(receivedResponse != nil)

    }

    @Test func test_data_failure() async throws {
        // GIVEN
        let url = URL(string: "https://testnotexist.com")!
        let request = URLRequest(url: url)
        let sharedSession = SharedURLSession()

        // WHEN
        let (receivedData, receivedResponse) = try await sharedSession.data(for: request)

        // THEN
        #expect(receivedData == nil)
        #expect(receivedResponse == nil)
    }

}
