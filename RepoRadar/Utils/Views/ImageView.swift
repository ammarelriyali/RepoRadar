//
//  ImageView.swift
//  RepoRadar
//
//  Created by ammar on 25/10/2023.
//

import Foundation
import SwiftUI
import Kingfisher

struct ImageView : View {
    
    let imageURL: String
    let placeholder: String?
    
    
    var body: some View {
        
        KFImage(URL(string: imageURL))
            .fade(duration: 0.25)
            .placeholder { _ in
                Image(placeholder ?? "")
                    .resizable()
                    .isHidden(placeholder == nil,remove: true)
            }.resizable()
    }
}

#Preview {
    
    ImageView(imageURL: "", placeholder: "ic_empty_avatar")
}
