//
//  RepositoryCardView.swift
//  RepoRadar
//
//  Created by ammar on 25/10/2023.
//

import SwiftUI
import Kingfisher

struct RepositoryCardView: View {
    
    let repository: RepositoryDomainModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            ImageView(imageURL: repository.repositoryImage ?? "",
                      placeholder: Constants.RepositoryCard.placeholder)
            .scaledToFill()
            .frame(height: 250,alignment: .center)
            .clipped()
            .isHidden(repository.repositoryImage == nil, remove: true)
            
            HStack(alignment: .center, spacing: 16) {
                
                ImageView(imageURL: repository.avatar ?? "",
                          placeholder: Constants.RepositoryCard.placeholder)
                .frame(width: 70, height: 70)
                .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text(repository.ownerName ?? "")
                        .font(.callout)
                        .foregroundStyle(Color.secondaryColor)
                    
                    Text(repository.repositoryName ?? "")
                        .font(.headline)
                        .foregroundStyle(Color.highlightColor)
                    
                }
                Spacer()
                
                Text(repository.data ?? "")
                    .font(.caption)
                    .foregroundStyle(Color.secondaryColor)
                
            }.padding(.all)
                .lineLimit(1)
            
        }.background(Color.primaryColor)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.primaryColor, lineWidth: 1)
            )
            
        
    }
}

#Preview {
    RepositoryCardView(repository: RepositoryDomainModel(id: 0,
                                                         ownerName: "Ammar",
                                                         repositoryName: "RepoRadar",
                                                         repositoryImage:"nil",
                                                         avatar: "",
                                                         data: "21-10-2021"
                                                        )
    )
}
