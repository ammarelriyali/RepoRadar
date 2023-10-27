//
//  RepositoriesRepoImp.swift
//  RepoRadar
//
//  Created by ammar on 26/10/2023.
//

import Foundation

struct RepositoriesRepoImp: RepositoriesRepoProtocol {

    let network : AnyNetwork
    
    func getMainRepositories() async throws -> [RepositoryDomainModel]? {
        let repositoriesResponse: [RepositoryDataModel]  = try await network.load(endPoint: "repositories",
                                                        parameters: nil,
                                                        method: .get)

        return repositoriesResponse.compactMap{ $0.mapToDomainModel() }
    }
    
    
    func getRepositories(repositories: [RepositoriesRequestDataModel]) async throws -> [RepositoryDomainModel]? {
        try await withThrowingTaskGroup(of: [RepositoryDomainModel].self) { group  in
            for repo in repositories {
                group.addTask {
                    let repository: RepositoryDataModel = try await network.load(endPoint: "repos/\(repo.owner)/\(repo.repository)",
                                                                              parameters: nil,
                                                                              method: .get)
                    return [repository.mapToDomainModel()]
                }
            }
            var result = [RepositoryDomainModel]()
            for try await repo in group {
                result.append(contentsOf: repo)
            }
            return result
        }
    }
    
}
