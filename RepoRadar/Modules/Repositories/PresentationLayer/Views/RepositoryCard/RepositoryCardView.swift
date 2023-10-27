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
                
            }.padding(.all)
                .lineLimit(1)
            
            Text(.init(repository.description ?? ""))
                .font(.callout)
                .foregroundStyle(Color.theme.highlight)
                .padding(.horizontal)
                .padding(.bottom,4)
                .isHidden(repository.description == nil,
                          remove: true)
            
                ImageWithTextView(imageName: "star.fill",
                                  color: Color.yellow,
                                  text: "\(repository.starsCount ?? 0 )")
                .isHidden(repository.starsCount == nil || (repository.starsCount ?? 0) == 0,
                          remove: true)
             
            
            ImageWithTextView(imageName: "eye.fill",
                              color: Color.theme.highlight,
                                  text: "\(repository.viewsCount ?? 0 )")
            .isHidden(repository.viewsCount == nil || (repository.starsCount ?? 0) == 0,
                      remove: true)
            
            HStack(spacing: 0) {
                ImageWithTextView(imageName: "text.alignleft",
                                  color: Color.theme.highlight,
                                  text: repository.language ?? "")
                .isHidden(repository.language == nil
                          ,remove: true)
    
                Spacer()
                Text(repository.date ?? "")
                    .font(.caption)
                    .foregroundStyle(Color.theme.secondary)
                    .padding(.trailing)
            }.padding(.bottom)
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
         RepositoryDomainModel(id: 0,
                               starsCount: 12,
                               viewsCount: 12323,
                               language: "C",
                               name: "RepoRadar",
                               image: "",
                               description: "**Grit is no longer maintained. Check out libgit2/rugged.** Grit gives you object oriented read/write access to Git repositories via Ruby.", date: "Last Month",
                               owner: owner
                                 ))
    
}
