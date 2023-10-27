//
//  RepositoryDomainModel.swift
//  RepoRadar
//
//  Created by ammar on 24/10/2023.
//

import Foundation

struct RepositoryDomainModel: Equatable {
    
    var nodeID: String?
    var name: String?
    var image: String?
    var date: String?
    var owner: OwnerDomainModel?
}

