//
//  ViewModel.swift
//  GameStream
//
//  Created by Ruben on 10/4/24.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var gamesInfo = [Game]()
    
    init() {
        
        let url = URL(string: "https://gamestreamapi.herokuapp.com/api/games")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                if let jsonData = data {
                    print("Json recibido \(jsonData)")
                    let decodeData = try JSONDecoder().decode([Game].self, from: jsonData)
                    DispatchQueue.main.async {
                        self.gamesInfo.append(contentsOf: decodeData)
                    }
                }
            } catch {
                print("Error petición GET: \(error)")
            }
        }.resume()
        
        
    }
    
}
