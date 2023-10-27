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
            
            ImageView(imageURL: repository.image ?? "",
                      placeholder: Constants.RepositoryCard.placeholder)
            .scaledToFill()
            .frame(height: 250,alignment: .center)
            .clipped()
            .isHidden(repository.image == nil, remove: true)
            
            HStack(alignment: .center, spacing: 16) {
                
                ImageView(imageURL: repository.owner?.avatar ?? "",
                          placeholder: Constants.RepositoryCard.placeholder)
                .frame(width: 70, height: 70)
                .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    
                    Text(repository.owner?.name ?? "")
                        .font(.callout)
                        .foregroundStyle(Color.theme.secondary)
                    
                    Text(repository.name ?? "")
                        .font(.headline)
                        .foregroundStyle(Color.theme.highlight)
                }
                Spacer()
                
                Text(repository.date ?? "")
                    .font(.caption)
                    .foregroundStyle(Color.theme.secondary)
                
            }.padding(.all)
                .lineLimit(1)
            
        }.background(Color.theme.backgroundCard)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.theme.backgroundCard, lineWidth: 1)
            )
            
        
    }
}

#Preview {
    let owner = OwnerDomainModel(name: "Ammar", avatar: "")
    
    return RepositoryCardView(repository:
         RepositoryDomainModel(nodeID: "0",
                               name: "RepoRadar",
                               image: "",
                               date: "Last Month",
                               owner: owner
                                 ))
    
}
