//
//  RemoteDataSource.swift
//  RepoRadar
//
//  Created by ammar on 19/09/2024.
//

import Foundation
struct RepositoriesRemoteDataSource: RepositoriesRemoteDataSourceProtocol {
    
    private let network : AnyNetwork
    
    init(network: AnyNetwork) {
        self.network = network
    }
    func getMainRepositories() async throws -> [RepositoryDataModel] {
        let repositoriesResponse: [RepositoryDataModel]  = try await network.load(endPoint: Constants.mainRepositoriesURL,
                                                        parameters: nil,
                                                        method: .get)

        return repositoriesResponse
    }
    
    
    func getRepositories(repositories: [RepositoriesRequestDataModel]) async throws -> [RepositoryDataModel] {
        try await withThrowingTaskGroup(of: [RepositoryDataModel].self) { group  in
            for repo in repositories {
                group.addTask {
                    let repository: RepositoryDataModel = try await network.load(endPoint: "\(Constants.reposURL)/\(repo.owner)/\(repo.repository)",
                                                                              parameters: nil,
                                                                              method: .get)
                    return [repository]
                }
            }
            
            var result = [RepositoryDataModel]()
            for try await repo in group {
                result.append(contentsOf: repo)
            }
            return result
        }
    }
    
}
