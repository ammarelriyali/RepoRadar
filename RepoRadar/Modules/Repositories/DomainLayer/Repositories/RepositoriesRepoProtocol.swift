//
//  RepositoriesRepoProtocol.swift
//  RepoRadar
//
//  Created by ammar on 26/10/2023.
//

import Foundation


protocol RepositoriesRepoProtocol {

    func getMainRepositories() async throws -> [RepositoryDomainModel]?
    func getRepositories(repositories: [RepositoriesRequestDataModel]) async throws -> [RepositoryDomainModel]?
}
