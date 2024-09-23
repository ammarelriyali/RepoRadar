//
//  RepositoriesRemoteDataSourceProtocol.swift
//  RepoRadar
//
//  Created by ammar on 23/09/2024.
//

protocol RepositoriesRemoteDataSourceProtocol {
    typealias Constants = RepositoriesRemoteDataSourceConstants
    func getMainRepositories() async throws -> [RepositoryDataModel]?
    func getRepositories(repositories: [RepositoriesRequestDataModel]) async throws -> [RepositoryDataModel]?
}
