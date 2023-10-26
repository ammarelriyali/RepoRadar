//
//  RepositoriesRepoImp.swift
//  RepoRadar
//
//  Created by ammar on 26/10/2023.
//

import Foundation

struct RepositoriesRepoImp {
    let network : AnyNetwork
    
    func getRepositories() async throws -> [RepositoryDomainModel]? {
        let repositoriesResponse: RepostoriesDataMainResponse  = try await network.load(endPoint: "repositories",
                                                        parameters: nil,
                                                        method: .get)

        return repositoriesResponse.result?.compactMap{ $0.mapToDomainModel() }
    }
}
