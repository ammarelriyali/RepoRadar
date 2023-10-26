//
//  RepositoriesRepoProtocol.swift
//  RepoRadar
//
//  Created by ammar on 26/10/2023.
//

import Foundation


protocol RepositoriesRepoProtocol {

    func getRepositories() async throws -> [RepositoryDomainModel]?
}
