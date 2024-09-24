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
                                                description: checkDescriptionNullability($0.description),
                                                date: getDate(dateString: $0.date ?? ""),
                                                owner: $0.owner)}
    }
    
    private func checkDescriptionNullability(_ description: String?) -> String? {
        return description == Constants.RepositoryUseCase.descriptionNull ? nil : description
    }
    
    private func getDate(dateString: String) -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.RepositoryUseCase.dateFormatDateWithTime
        dateFormatter.timeZone = TimeZone(abbreviation: Constants.RepositoryUseCase.timeZone)
        
        if let date = dateFormatter.date(from: dateString) {
            
            let currentDate = Date()
            
            let calendar = Calendar.current
            let components = calendar.dateComponents([.month, .year], from: date, to: currentDate)
            let monthsAgo = components.month!
            let yearsAgo = components.year!
            
            if monthsAgo < Constants.RepositoryUseCase.monthsAgoNumber {
                
                let resultFormatter = DateFormatter()
                resultFormatter.dateFormat = Constants.RepositoryUseCase.dateFormatDate
                return resultFormatter.string(from: date)
            } else {
                
                if yearsAgo == Constants.RepositoryUseCase.yearsAgoNumber {
                    return "\(monthsAgo) \(Constants.RepositoryUseCase.monthsAgoString)"
                }
                else {
                    return "\(yearsAgo) \(Constants.RepositoryUseCase.yearsAgoString)"
                }
            }
        } else {
            return Constants.RepositoryUseCase.nullValue
        }
    }
}
