//
//  MockRepositoriesUseCase.swift
//  RepoRadarTests
//
//  Created by Ammar on 14/05/2024.
//

import Foundation
@testable import RepoRadar
import Alamofire

class MockRepositoriesUseCase: RepositoriesUseCaseProtocol {
    var mainRepositoriesResult: Result<[RepositoryDomainModel], AFError>?
    var repositoriesResult: Result<[RepositoryDomainModel], AFError>?
    
    func getMainRepositories() async -> Result<[RepositoryDomainModel], AFError> {
        return mainRepositoriesResult ?? .failure(.explicitlyCancelled)
    }
    
    func getRepositories(repositories: [RepositoriesRequestDomainModel]) async -> Result<[RepositoryDomainModel], AFError> {
        return repositoriesResult ?? .failure(.explicitlyCancelled)
    }
}
