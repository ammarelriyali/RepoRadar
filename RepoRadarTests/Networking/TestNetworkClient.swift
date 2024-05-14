//
//  TestNetworkClient.swift
//  RepoRadarTests
//
//  Created by Ammar on 14/05/2024.
//

import XCTest
import Alamofire
@testable import RepoRadar

final class TestNetworkClient: XCTestCase {
    let networkClient = NetworkClient.shared
    
    // MARK: - Test Cases
    // Test successful data loading
    func testLoad_Successful() {
        // Given
        let endPoint = "repositories"
        let expectation = expectation(description: "Successful data loading expectation")

        // When
        Task {
            do {
                let loadedData: RepositoryDataModel = try await networkClient.load(
                    endPoint: endPoint,
                    parameters: nil,
                    method: .get
                )
                // Then
                XCTAssertNotNil(loadedData)
                expectation.fulfill()
            } catch {
                XCTFail("Unexpected error: \(error)")
            }
        }

        // Wait for async operation to complete
        waitForExpectations(timeout: 5) // Adjust timeout as per your need
    }

    // Test error handling
    func testLoad_Error() {
        // Given
        let networkClient = NetworkClient.shared
        let endPoint = "/nonExistingEndPoint"
        let expectation = expectation(description: "Error handling expectation")

        // When
        Task {
            do {
                // This should throw an error since the endpoint doesn't exist
                let loadedData: RepositoryDataModel = try await networkClient.load(
                    endPoint: endPoint,
                    parameters: nil,
                    method: .get
                )
                // If no error is thrown, fail the test
                XCTFail("Expected an error, but call succeeded")
            } catch {
                // Then
                // Ensure that the error is of the expected type
                XCTAssertTrue(error is AFError)
                expectation.fulfill()
            }
        }

        // Wait for async operation to complete
        waitForExpectations(timeout: 5) // Adjust timeout as per your need
    }
}
