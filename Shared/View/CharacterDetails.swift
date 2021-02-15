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
                
                WebImage(url:
                            URL(
                                string: "\(character.thumbnail?.path ?? "").\(character.thumbnail?.pathExtension ?? "")")
                )
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous), style: FillStyle())
                
                Spacer()
                
                // Adjust font for iPad
                if horizontalSizeClass == .compact {
                    Text("\(character.description ?? "")")
                    
                } else {
                    Text("\(character.description ?? "")")
                        .font(.title)
                }
                
                    
            }
            .frame(maxWidth: 800, maxHeight: 600)
        }
        .navigationTitle(character.name ?? "")
        .padding()
    }
}

