//
//  ContentView.swift
//  Shared
//
//  Created by Juliano Alvarenga on 13/02/21.
//

import SwiftUI
import Combine
import SDWebImageSwiftUI


struct ContentView: View {    
    @StateObject private var viewModel = ViewModel()
    @State private var showGrid = false
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        NavigationView {
            ScrollView {
                MainLazyGrid(
                    characters: viewModel.characters,
                    showGrid: $showGrid
                )
                .navigationTitle("Characters")
                .toolbar(content: {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        
                        // Toogle button for
                        // change to grid only for iPhone
                        if horizontalSizeClass == .compact {
                            Button(action: {changeList()}, label: {
                                changeListIcon
                            })
                        }
                    }
                })
            }
        }
        .onAppear {
            viewModel.fetch()
        }
    }
    
    var changeListIcon: some View {
        Image(systemName: showGrid ? "list.dash" : "square.grid.2x2.fill")
    }
    
    private func changeList() {
        showGrid.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

