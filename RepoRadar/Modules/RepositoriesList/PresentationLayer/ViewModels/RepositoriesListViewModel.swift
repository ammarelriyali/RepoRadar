//
//  RepositoriesListViewModel.swift
//  RepoRadar
//
//  Created by ammar on 25/10/2023.
//

import Foundation

class RepositoriesListViewModel: ObservableObject {
    
    @Published var repositories: [RepositoryDomainModel] = []
    @Published var isLoading: Bool = false
    
    func loadMoreRepostory(){
        
    } 
    func loadRepostory(){
        
    }
    
    private func setUpTasksDummyData() {
        guard repositories.isEmpty else { return }
        repositories = [
             RepositoryDomainModel(id: 0,
                                      ownerName: "Ammar",
                                      repositoryName: "RepoRadar",
                                      repositoryImage: "",
                                      avatar: "",
                                      data: "21-10-2021"
                                     ),
            RepositoryDomainModel(id: 0,
                                       ownerName: "Ammar",
                                       repositoryName: "RepoRadar",
                                       repositoryImage: "",
                                       avatar: "",
                                       data: "Last Month"
                                      ),
              RepositoryDomainModel(id: 0,
                                       ownerName: "Ammar",
                                       repositoryName: "RepoRadar",
                                       repositoryImage: nil,
                                       avatar: "",
                                       data: "Last Month"
                                      ),
              RepositoryDomainModel(id: 0,
                                       ownerName: "Ammar",
                                       repositoryName: "RepoRadar",
                                       repositoryImage:"",
                                       avatar: "",
                                       data: "Last Month"
                                      ),
             RepositoryDomainModel(id: 0,
                                       ownerName: "Ammar",
                                       repositoryName: "RepoRadar",
                                       repositoryImage:nil,
                                       avatar: "",
                                       data: "Last Month"
                                      )
        ]
    }
}
