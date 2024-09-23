//
//  RepositoriesRepoImp.swift
//  RepoRadar
//
//  Created by ammar on 26/10/2023.
//

import Foundation
import Alamofire

struct RepositoriesRepoImp: RepositoriesRepoProtocol {

    private let remoteDataSource: RepositoriesRemoteDataSourceProtocol
    
    init(remoteDataSource: RepositoriesRemoteDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
    }
    
    func getMainRepositories() async -> Result<[RepositoryDomainModel],
                                               AFError> {
        do {
            let repositoriesResponse: [RepositoryDataModel]  = try await remoteDataSource.getMainRepositories()
            return .success(repositoriesResponse.compactMap{ $0.mapToDomainModel() })
        } catch {
            if let error = error as? AFError {
                return .failure(error)
            } else {
                return .failure(.explicitlyCancelled)
            }
        }
    }
    func getRepositories(repositories: [RepositoriesRequestDataModel]) async -> Result<[RepositoryDomainModel], AFError> {
        do {
            let repositoriesResponse: [RepositoryDataModel]  = try await remoteDataSource.getRepositories(repositories: repositories)
            return .success(repositoriesResponse.compactMap{ $0.mapToDomainModel() })
        }  catch {
            if let error = error as? AFError {
                return .failure(error)
            } else {
                return .failure(.explicitlyCancelled)
            }
        }
    }
}
