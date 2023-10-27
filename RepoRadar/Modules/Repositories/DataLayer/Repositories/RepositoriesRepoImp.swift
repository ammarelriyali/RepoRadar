//
//  RepositoriesRepoImp.swift
//  RepoRadar
//
//  Created by ammar on 26/10/2023.
//

import Foundation

struct RepositoriesRepoImp: RepositoriesRepoProtocol {
    let network : AnyNetwork
    
    func getRepositories() async throws -> [RepositoryDomainModel]? {
        let repositoriesResponse: [RepostoryDataModel]  = try await network.load(endPoint: "repositories",
                                                        parameters: nil,
                                                        method: .get)

        return repositoriesResponse.compactMap{ $0.mapToDomainModel() }
    }
}
