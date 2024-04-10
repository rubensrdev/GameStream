//
//  GameView.swift
//  GameStream
//
//  Created by Ruben on 10/4/24.
//

import SwiftUI

struct GameView: View {
    
    var gameData: GameData?
    
    var body: some View {
        if let title = gameData?.title {
            Text("Información para el juego \(title)")
                .textCase(.uppercase)
                .bold()
                .font(.title)
        }
        
    }
}

#Preview {
    GameView()
}
