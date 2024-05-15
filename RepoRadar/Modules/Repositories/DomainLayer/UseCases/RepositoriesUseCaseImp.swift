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
        do {
            guard let repositoriesResponse = try await repository.getMainRepositories() else {
                return .failure(.explicitlyCancelled)
            }
            return .success(repositoriesResponse)
        } catch {
            if let error = error as? AFError {
                return .failure(error)
            } else {
                return .failure(.explicitlyCancelled)
            }
        }
    }
    
    func getRepositories(repositories: [RepositoriesRequestDomainModel]) async -> Result<[RepositoryDomainModel], Alamofire.AFError> {
        do {
            guard let repositoriesResponse = try await repository.getRepositories(repositories:
                                                                                    repositories.map{ $0.mapToDataModel()})
            else {
                return .failure(.explicitlyCancelled)
            }
            
            return .success(repositoriesResponse.map {RepositoryDomainModel(id: $0.id,
                                                                            starsCount: $0.starsCount,
                                                                            viewsCount: $0.viewsCount,
                                                                            language: $0.language,
                                                                            name: $0.name,
                                                                            image: nil,
                                                                            description: checkDesciption($0.description),
                                                                            date: getDate(dateString: $0.date ?? ""),
                                                                            owner: $0.owner)
            })
            
        } catch {
            if let error = error as? AFError {
                return .failure(error)
            } else {
                return .failure(.explicitlyCancelled)
            }
        }
        
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
