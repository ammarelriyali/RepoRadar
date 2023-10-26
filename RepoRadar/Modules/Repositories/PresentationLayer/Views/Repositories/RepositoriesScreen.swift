//
//  RepositoriesListScreen.swift
//  RepoRadar
//
//  Created by ammar on 24/10/2023.
//

import SwiftUI
import SwiftUIPullToRefresh

struct RepositoriesListScreen: View {
    @ObservedObject var viewModel: RepositoriesListViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            
            Text(Constants.RepositoriesList.appName)
                .font(.title)
                .foregroundStyle(Color.highlight)
            
            RefreshableScrollView(showsIndicators: false,
                                  loadingViewBackgroundColor: .backgroundColor) { doneRefreshing in
                viewModel.loadRepostory()
                doneRefreshing()
            } content: {
                LazyVStack(spacing: 10) {
                    
                    Spacer()
                    
                    ForEach($viewModel.repositories, id: \.id) { repository in
                        RepositoryCardView(repository: repository.wrappedValue)
                    }
                    HStack {
                        Spacer()
                        ProgressView()
                            .onAppear {
                                viewModel.loadMoreRepostory()
                            }
                        Spacer()
                    }.isHidden(viewModel.isLoading || viewModel.listIsFull
                               ,remove: true)
                    Spacer()
                }.isHidden(viewModel.repositories.isEmpty, remove: true)
                
            }.redacted(reason: viewModel.isLoading ? .placeholder : [])
                .padding(.horizontal, 20)
                .background(Color.backgroundColor)
                .onAppear {
                    viewModel.loadRepostory()
                }
        }
    }
}

#Preview {
    RepositoriesListScreen(viewModel: RepositoriesListViewModel())
}
