//
//  RepositoriesListScreen.swift
//  RepoRadar
//
//  Created by ammar on 24/10/2023.
//

import SwiftUI
import SwiftUIPullToRefresh

struct RepositoriesListScreen: View {
    
    @ObservedObject var viewModel: RepositoriesViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            
            Text(Constants.RepositoriesList.appName)
                .font(.title)
                .foregroundStyle(Color.highlight)
                .padding(.horizontal)
            
            RefreshableScrollView(showsIndicators: false,
                                  loadingViewBackgroundColor: .theme.background) { doneRefreshing in
                Task {
                    await viewModel.loadRepostoriesList()
                }
                doneRefreshing()
            } content: {
                LazyVStack(spacing: 10) {
                    
                    Spacer()
                    
                    ForEach($viewModel.repositories, id: \.nodeID) { repository in
                        RepositoryCardView(repository: repository.wrappedValue)
                    }
                    HStack {
                        Spacer()
                        ProgressView()
//                            .onAppear {
//                                await viewModel.loadRepostoriesList()
//                            }
                        Spacer()
                    }.isHidden(viewModel.isLoading || viewModel.listIsFull
                               ,remove: true)
                    Spacer()
                }.isHidden(viewModel.repositories.isEmpty, remove: true)
                
            }.redacted(reason: viewModel.isLoading ? .placeholder : [])
                .padding(.horizontal, 20)
                .background(Color.theme.background)
                .task {
                    await viewModel.loadRepostoriesList()
                }
        }.background(Color.theme.backgroundCard)
    }
}

#Preview {
    RepositoriesListScreen(viewModel: RepositoriesViewModel(useCase: RepositoriesUseCaseImp(repository: RepositoriesRepoImp(network: NetworkClient.shared))))
}
