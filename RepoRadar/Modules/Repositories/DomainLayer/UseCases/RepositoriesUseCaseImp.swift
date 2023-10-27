//
//  RepositoriesUseCaseImp.swift
//  RepoRadar
//
//  Created by ammar on 26/10/2023.
//

import Foundation
import Alamofire

struct RepositoriesUseCaseImp: RepositoriesUseCaseProtocol {
     
    private let repository: RepositoriesRepoProtocol
    
    init(repository: RepositoriesRepoProtocol) {
        self.repository = repository
    }
    
    func getRepositories(page: Int) async -> Result<[RepositoryDomainModel], AFError> {
        do {
            guard let repositoriesResponse = try await repository.getRepositories() else {
                return .failure(.explicitlyCancelled)
            }
            return .success(repositoriesResponse)
        } catch {
            if let error = error as? AFError {
                return .failure(error)
            } else {
                return .failure(.explicitlyCancelled)
            }
        }
    }
}
