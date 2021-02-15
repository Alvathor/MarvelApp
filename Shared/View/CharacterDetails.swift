//
//  CharacterDetails.swift
//  MarvelApp
//
//  Created by Juliano Alvarenga on 14/02/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterDetail: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass    
    var character: Results
    
    var body: some View {
        ScrollView {
            VStack {
                // Character Image
                WebImage(url:
                            URL(
                                string: "\(character.thumbnail?.path ?? "").\(character.thumbnail?.pathExtension ?? "")")
                )
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous), style: FillStyle())
                Spacer()
                       
                // Description
                descriptionText
            }
            .frame(maxWidth: 800, maxHeight: 600)
        }
        .navigationTitle(character.name ?? "")
        .padding()
    }
        
    // Adjust font for iPad or iPhone
    var descriptionText: some View {
        if horizontalSizeClass == .compact {
            return Text("\(character.description ?? "")")
            
        } else {
            return Text("\(character.description ?? "")")
                .font(.title)
        }
    }
}

