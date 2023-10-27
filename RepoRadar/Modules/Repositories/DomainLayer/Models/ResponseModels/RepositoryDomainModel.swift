//
//  RepositoryDomainModel.swift
//  RepoRadar
//
//  Created by ammar on 24/10/2023.
//

import Foundation

struct RepositoryDomainModel: Equatable {
    
    var id: Int?
    var name: String?
    var image: String?
    var description: String?
    var date: String?
    var owner: OwnerDomainModel?
}

