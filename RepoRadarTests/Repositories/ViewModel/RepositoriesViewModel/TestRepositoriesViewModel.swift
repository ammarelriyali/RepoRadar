//
//  TestRepositoriesViewModel.swift
//  RepoRadarTests
//
//  Created by Ammar on 14/05/2024.
//

import XCTest
@testable import RepoRadar // Replace with your module name

class RepositoriesViewModelTests: XCTestCase {

    // MARK: - Test Properties

    var viewModel: RepositoriesViewModel!
    var mockUseCase: MockRepositoriesUseCase!
    var dumyRepositoryData: [RepositoryDomainModel] {
        let owner = OwnerDomainModel(name: "Ammar", avatar: "")
        
        return [
            RepositoryDomainModel(id: 0,
                                  starsCount: 12,
                                  viewsCount: 12323,
                                  language: "python",
                                  name: "RepoRadar",
                                  image: "",
                                  description: "Treat an ActiveRecord model as a file attachment",
                                  date: "Last Month",
                                  owner: owner
                                 ),
            RepositoryDomainModel(id: 1,
                                  starsCount: 12,
                                  viewsCount: 12323,
                                  language: "python",
                                  name: "RepoRadar",
                                  image: nil,
                                  date: "22-4-2011",
                                  owner: owner
                                 ),
            RepositoryDomainModel(id: 2,
                                  starsCount: 12,
                                  viewsCount: 12323,
                                  language: "python",
                                  name: "RepoRadar",
                                  image: "",
                                  date: "Last Month",
                                  owner: owner
                                 ),
            RepositoryDomainModel(id: 3,
                                  starsCount: 12,
                                  viewsCount: 12323,
                                  language: "python",
                                  name: "RepoRadar",
                                  image: "",
                                  date: "Last Month",
                                  owner: owner
                                 ),
            RepositoryDomainModel(id: 4,
                                  starsCount: 12,
                                  viewsCount: 12323,
                                  language: "python",
                                  name: "RepoRadar",
                                  image: "",
                                  date: "Last Month",
                                  owner: owner
                                 ),
            RepositoryDomainModel(id: 5,
                                  starsCount: 12,
                                  viewsCount: 12323,
                                  language: "python",
                                  name: "RepoRadar",
                                  image: "",
                                  date: "Last Month",
                                  owner: owner
                                 )
        ]
    }

    // MARK: - Test Lifecycle
    @MainActor

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockUseCase = MockRepositoriesUseCase()
        viewModel = RepositoriesViewModel(useCase: mockUseCase)
        
        mockUseCase.repositoriesResult = .success(dumyRepositoryData)
        mockUseCase.mainRepositoriesResult = .success(dumyRepositoryData)
           
    }

    override func tearDownWithError() throws {
        viewModel = nil
        mockUseCase = nil
        try super.tearDownWithError()
    }

    // MARK: - Test Cases
    func testLoadRepositoriesList_Successful() {
        // Given
        let expectation = XCTestExpectation(description: "Repositories loaded successfully")

        // When
        Task {
            await viewModel.loadRepostoriesList()

            // Then
            await MainActor.run {
                XCTAssertEqual(viewModel.repositories.count, dumyRepositoryData.count)
                   XCTAssertFalse(viewModel.isLoading)
                   XCTAssertTrue(viewModel.errorMsg.isEmpty)
               }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 5) // Adjust timeout as per your need
    }

    // Write more test cases to cover other scenarios such as error handling, loading more repositories, etc.
}
