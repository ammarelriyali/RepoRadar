//
//  RepositoriesRequestDominModel.swift
//  RepoRadar
//
//  Created by ammar on 27/10/2023.
//

import Foundation

struct RepositoriesRequestDomainModel {
    
    var owner: String
    var repository: String

    func mapToDataModel() -> RepositoriesRequestDataModel {
        RepositoriesRequestDataModel(owner: owner,
                                     repository: repository)
    }
}
