//
//  RepositoriesListScreen.swift
//  RepoRadar
//
//  Created by ammar on 24/10/2023.
//

import SwiftUI
import SwiftUIPullToRefresh

struct RepositoriesListScreen: View {
    var body: some View {
        RefreshableScrollView(showsIndicators: false,
                              loadingViewBackgroundColor: .backgroundColor) { doneRefreshing in
//            loadSubTasksList()
//            doneRefreshing()
        } content: {
            
        }
    }
}

#Preview {
    RepositoriesListScreen()
}
