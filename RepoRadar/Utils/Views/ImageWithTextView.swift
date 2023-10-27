//
//  ImageWithTextView.swift
//  RepoRadar
//
//  Created by ammar on 27/10/2023.
//

import SwiftUI
struct ImageWithTextView: View {
    
    let imageName: String
    let color: Color
    let text: String
    
    var body: some View {
        
        HStack(spacing: 16) {
            Image(systemName: imageName)
                .foregroundStyle(color)
                .frame(width: 10,height: 10)
            
            Text(text)
                .foregroundStyle(Color.theme.highlight)
        }.padding(.horizontal)
            .padding(.vertical,2)
    }
}


#Preview {
    ImageWithTextView(imageName: "start", color: .red, text: "123")
}
