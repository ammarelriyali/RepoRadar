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
    
    private var page = 1
    private var totalItemsCount = 0
    private var mainRepositories: [RepositoryDomainModel] = []
    
    private let useCase: RepositoriesUseCaseProtocol
    
    init(useCase: RepositoriesUseCaseProtocol) {
        self.useCase = useCase
    }
    
    private func getMainRepositories() async -> [RepositoryDomainModel] {
        
        mainRepositories = []
        listIsFull = false
        let response = await useCase.getMainRepositories()
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
    
    private func getRepositories(range: Range<Int>) async -> [RepositoryDomainModel] {
        
        mainRepositories = await getMainRepositories()
        guard !mainRepositories.isEmpty else { return []}
        
        let response = await useCase.getRepositories(repositories: mainRepositories[range].map{
            RepositoriesRequestDomainModel(owner: $0.owner?.name ?? "",
                                          repository: $0.name ?? "")
        })
        switch response {
        case .success(let repositories):
            return repositories
        case .failure(let error):
            self.errorMsg = error.localizedDescription
            print(errorMsg)
        }
        return []
    }
    
    func loadRepostoriesList() async {
        setUpTasksDummyData()
        page = 1
        isLoading = true
        repositories = await getRepositories(range: (0..<10))
        isLoading = false
    }
    
    func loadMoreRepostories() async {
        
        let myRange = getRange()
        page += 1
        let newRepositories = await getRepositories(range: myRange)
        repositories.append(contentsOf:newRepositories)
        listIsFull = repositories.count == totalItemsCount
    }
    
    
    
    private func getRange() -> Range<Int>{
        
        let maxNumber = (page + 1) * 10
        let maxRange = (maxNumber > totalItemsCount) ? ((totalItemsCount  % 10) + page * 10) : maxNumber
        return (page * 10)..<maxRange
    }
    private func setUpTasksDummyData() {
        
        guard repositories.isEmpty else { return }
        let owner = OwnerDomainModel(name: "Ammar", avatar: "")
        
        repositories = [
            RepositoryDomainModel(id: 0,
                                  starsCount: 12,
                                  viewsCount: 12323,
                                  language: "python",
                                  name: "RepoRadar",
                                  image: "",
                                  description: "Treat an ActiveRecord model as a file attachment",
                                  date: "Last Month",
                                  owner: owner
                                 ),
            RepositoryDomainModel(id: 1,
                                  starsCount: 12,
                                  viewsCount: 12323,
                                  language: "python",
                                  name: "RepoRadar",
                                  image: nil,
                                  date: "22-4-2011",
                                  owner: owner
                                 ),
            RepositoryDomainModel(id: 2,
                                  starsCount: 12,
                                  viewsCount: 12323,
                                  language: "python",
                                  name: "RepoRadar",
                                  image: "",
                                  date: "Last Month",
                                  owner: owner
                                 ),
            RepositoryDomainModel(id: 3,
                                  starsCount: 12,
                                  viewsCount: 12323,
                                  language: "python",
                                  name: "RepoRadar",
                                  image: "",
                                  date: "Last Month",
                                  owner: owner
                                 ),
            RepositoryDomainModel(id: 4,
                                  starsCount: 12,
                                  viewsCount: 12323,
                                  language: "python",
                                  name: "RepoRadar",
                                  image: "",
                                  date: "Last Month",
                                  owner: owner
                                 ),
            RepositoryDomainModel(id: 5,
                                  starsCount: 12,
                                  viewsCount: 12323,
                                  language: "python",
                                  name: "RepoRadar",
                                  image: "",
                                  date: "Last Month",
                                  owner: owner
                                 )
        ]
    }
}
