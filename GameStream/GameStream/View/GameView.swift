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
        Text("Información para el juego \(gameData?.title)!")
            .textCase(.uppercase)
            .bold()
            .font(.title)
    }
}

#Preview {
    GameView()
}
