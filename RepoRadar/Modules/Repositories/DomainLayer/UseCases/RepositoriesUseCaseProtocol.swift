//
//  RepositoriesUseCaseProtocol.swift
//  RepoRadar
//
//  Created by ammar on 26/10/2023.
//

import Foundation
import Alamofire

protocol RepositoriesUseCaseProtocol {
    
    func getRepositories() async -> Result<[RepositoryDomainModel], AFError>
}
