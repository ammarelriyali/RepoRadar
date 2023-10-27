//
//  RepositoriesViewModel.swift
//  RepoRadar
//
//  Created by ammar on 25/10/2023.
//

import Foundation

@MainActor
class RepositoriesViewModel: ObservableObject {
    
    @Published var repositories: [RepositoryDomainModel] = []
    @Published var isLoading: Bool = false
    @Published var listIsFull = false
    @Published var errorMsg = ""

    private var page = 0
    private var totalItemsCount = 0

    private let useCase: RepositoriesUseCaseProtocol
    
    init(useCase: RepositoriesUseCaseProtocol) {
        
        self.useCase = useCase
    }
    
    private func getRepositories() async -> [RepositoryDomainModel] {
        
        let response = await useCase.getRepositories(page: page)
        
                switch response {
        case .success(let repositories):
                    totalItemsCount = repositories.count
            return repositories
        case .failure(let error):
                    self.errorMsg = error.localizedDescription
                    print(errorMsg)
        }
        return []
    }

    func loadRepostoriesList() async {
        setUpTasksDummyData()
        page = 0
        isLoading = true
        repositories = await getRepositories()
        isLoading = false
//        listIsFull = repositories.count == totalItemsCount
    }

    func loadMoreRepostories() async {
//        page += 1
//        repositories = await getRepositories()
//        listIsFull = repositories.count == totalItemsCount
    }
    
   
    
    private func setUpTasksDummyData() {
        
        guard repositories.isEmpty else { return }
        let owner = OwnerDomainModel(name: "Ammar", avatar: "")
        
        repositories = [
             RepositoryDomainModel(nodeID: "0",
                                   name: "RepoRadar",
                                   image: "",
                                   date: "Last Month",
                                   owner: owner
                                     ),    
             RepositoryDomainModel(nodeID: "1",
                                   name: "RepoRadar",
                                   image: "",
                                   date: "22-4-2011",
                                   owner: owner
                                     ),
             RepositoryDomainModel(nodeID: "2",
                                   name: "RepoRadar",
                                   image: "",
                                   date: "Last Month",
                                   owner: owner
                                     ),
             RepositoryDomainModel(nodeID: "3",
                                   name: "RepoRadar",
                                   image: "",
                                   date: "Last Month",
                                   owner: owner
                                     ),
             RepositoryDomainModel(nodeID: "4",
                                   name: "RepoRadar",
                                   image: "",
                                   date: "Last Month",
                                   owner: owner
                                     ),
             RepositoryDomainModel(nodeID: "5",
                                   name: "RepoRadar",
                                   image: "",
                                   date: "Last Month",
                                   owner: owner
                                     )
        ]
    }
}
