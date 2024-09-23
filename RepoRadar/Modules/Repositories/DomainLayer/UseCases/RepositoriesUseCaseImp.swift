//
//  RepositoriesUseCaseImp.swift
//  RepoRadar
//
//  Created by ammar on 26/10/2023.
//

import Foundation
import Alamofire

struct RepositoriesUseCaseImp: RepositoriesUseCaseProtocol {
    
    private let repository: RepositoriesRepoProtocol
    
    init(repository: RepositoriesRepoProtocol) {
        self.repository = repository
    }
    
    func getMainRepositories() async -> Result<[RepositoryDomainModel], AFError> {

        return await repository.getMainRepositories()
    }
    
    func getRepositories(repositories: [RepositoriesRequestDomainModel]) async -> Result<[RepositoryDomainModel], AFError> {
            let repositoriesResponse =  await repository.getRepositories(repositories:
                                                                                    repositories.map{ $0.mapToDataModel()})
        switch repositoriesResponse {
        case .success(let repositories):
            return .success(createCustomRepositoryDomainModel(repositories))
        case .failure(let error):
            return .failure(error)
        }
    }
    
    private func createCustomRepositoryDomainModel(_ repositories: [RepositoryDomainModel]) -> [RepositoryDomainModel] {
        repositories.map {RepositoryDomainModel(id: $0.id,
                                                starsCount: $0.starsCount,
                                                viewsCount: $0.viewsCount,
                                                language: $0.language,
                                                name: $0.name,
                                                image: nil,
                                                description: checkDesciption($0.description),
                                                date: getDate(dateString: $0.date ?? ""),
                                                owner: $0.owner)}
    }
    
    private func checkDesciption(_ desciption: String?) -> String? {
        return desciption == "null" ? nil : desciption
    }
    private func getDate(dateString: String) -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        if let date = dateFormatter.date(from: dateString) {
            
            let currentDate = Date()
            
            let calendar = Calendar.current
            let components = calendar.dateComponents([.month, .year], from: date, to: currentDate)
            let monthsAgo = components.month!
            let yearsAgo = components.year!
            
            if monthsAgo < 6 {
                
                let resultFormatter = DateFormatter()
                resultFormatter.dateFormat = "EEEE, MMM dd, yyyy"
                return resultFormatter.string(from: date)
            } else {
                
                if yearsAgo == 0 {
                    return "\(monthsAgo) months ago"
                }
                else {
                    return "\(yearsAgo) years ago"
                }
            }
        } else {
            print("Invalid date string")
            return ""
        }
    }
}
