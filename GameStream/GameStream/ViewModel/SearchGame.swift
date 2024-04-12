//
//  SearchGame.swift
//  GameStream
//
//  Created by Ruben on 12/4/24.
//

import Foundation

class SearchGame: ObservableObject {
    
    @Published var gameInfo = [Game]()
    
    func search(_ gameName: String) {
        
        gameInfo.removeAll()
        // permite espacios en la url de la petición
        let gameNameSpaces = gameName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: "https://gamestreamapi.herokuapp.com/api/games/search?contains=\(gameNameSpaces ?? "cuphead")")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                if let jsonData = data {
                    print("Json recibido en búsqueda \(jsonData)")
                    let decodeData = try JSONDecoder().decode(Resultados.self, from: jsonData)
                    DispatchQueue.main.async {
                        self.gameInfo.append(contentsOf: decodeData.results)
                    }
                }
            } catch {
                print("Error petición GET: \(error)")
            }
        }.resume()
    }

}
