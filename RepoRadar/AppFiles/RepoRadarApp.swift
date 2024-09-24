//
//  RepoRadarApp.swift
//  RepoRadar
//
//  Created by ammar on 24/10/2023.
//

import SwiftUI

@main
struct RepoRadarApp: App {

    var body: some Scene {
        WindowGroup {
            RepositoriesListScreen(viewModel:
                                    RepositoriesViewModel(useCase:
                                                            RepositoriesUseCaseImp(repository: RepositoriesRepoImp(remoteDataSource: RepositoriesRemoteDataSource(network: NetworkClient.shared)))))
        }
    }
}
