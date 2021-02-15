//
//  ViewModel.swift
//  MarvelApp
//
//  Created by Juliano Alvarenga on 14/02/21.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    
    @Published var characters: [Results] = [] // 1
    var cancellationToken: AnyCancellable? // 2
    
    init() {
        fetch()
    }
    
    func fetch() {
        guard let url = URL(string: "https://gateway.marvel.com/v1/public/characters?ts=1613255468&apikey=a2ef8783536e3323c64fde7d64d3087b&hash=64bea5a3f951323d80c9239739b66600") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let result = try! JSONDecoder().decode(CharactersModel.self, from: data!)
                        
            DispatchQueue.main.async {
                self.characters = result.data?.results ?? []
            }
            
            
        }.resume()
            
    }
    
}

