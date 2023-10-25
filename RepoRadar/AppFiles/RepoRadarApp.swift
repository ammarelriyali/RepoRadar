//
//  RepoRadarApp.swift
//  RepoRadar
//
//  Created by ammar on 24/10/2023.
//

import SwiftUI

@main
struct RepoRadarApp: App {
    let viewModel = RepositoriesListViewModel()
    var body: some Scene {
        WindowGroup {
            RepositoriesListScreen(viewModel: viewModel)
        }
    }
}
