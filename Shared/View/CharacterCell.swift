//
//  CharacterCell.swift
//  MarvelApp
//
//  Created by Juliano Alvarenga on 14/02/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterCell: View {
    var character: Results
    @Binding var showGrid: Bool
    
    var body: some View {
        ZStack {
            WebImage(url:
                        URL(string: "\(character.thumbnail?.path ?? "").\(character.thumbnail?.pathExtension ?? "")")
            )
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous), style: FillStyle())
            VStack {
                Spacer()
                Text("\(character.name ?? "")")
                    .font(.system(size: showGrid ? 16 : 30, weight: showGrid ? .bold : .semibold, design: .rounded))
                    .padding()
                    .background(Color(UIColor.systemBackground).opacity(0.8))
                    .clipShape(Capsule())
                    .padding(.bottom, 16)
                    .foregroundColor(.primary)
            }
            
        }
    }
}
