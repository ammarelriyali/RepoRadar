//
//  RepositoriesRepoProtocol.swift
//  RepoRadar
//
//  Created by ammar on 26/10/2023.
//

import Foundation
import Alamofire

protocol RepositoriesRepoProtocol {

    func getMainRepositories() async -> Result<[RepositoryDomainModel],
                                               AFError>
    func getRepositories(repositories: [RepositoriesRequestDataModel]) async  -> Result<[RepositoryDomainModel],
                                                                                        AFError>
}
