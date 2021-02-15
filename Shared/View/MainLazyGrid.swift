//
//  MainLazyGrid.swift
//  MarvelApp
//
//  Created by Juliano Alvarenga on 14/02/21.
//

import SwiftUI

struct MainLazyGrid: View {    
    var characters: [Results]
    @Binding var showGrid: Bool
    
    var body: some View {
        LazyVGrid(
            columns:[
                GridItem(
                    .adaptive(
                        minimum: showGrid ? UIScreen.main.bounds.width * 0.4 : UIScreen.main.bounds.width,
                        maximum: UIScreen.main.bounds.width
                    ), spacing: 16
                )
            ],
            spacing: 16,
            content: {
                
                // List of characters
                ForEach(characters, id: \.name) { character in
                    NavigationLink(
                        destination: CharacterDetail(character: character),
                        label: {
                            CharacterCell(
                                character: character,
                                showGrid: $showGrid
                            )
                            .padding()
                        })
                }
            })
            .animation(.easeIn)
    }
}
