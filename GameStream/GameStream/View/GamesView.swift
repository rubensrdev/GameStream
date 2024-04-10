//
//  GamesView.swift
//  GameStream
//
//  Created by Ruben on 10/4/24.
//

import SwiftUI

struct GamesView: View {
    
    @ObservedObject var games = ViewModel()
    @State var gameViewIsActive: Bool = false
    @State var url: String = ""
    @State var titulo: String = ""
    @State var studio: String = ""
    @State var contentRaiting: String = ""
    @State var publicationYear: String = ""
    @State var description: String = ""
    @State var platforms: [String] = []
    @State var tags: [String] = []
    @State var galleryImages: [String] = []
    
    var body: some View {
        Text("Pantalla JUEGOS")
            .font(.title)
            .bold()
            .fontDesign(.rounded)
            .onAppear(
                
                perform: {
                    print("Primer elemento del json: \(games.gamesInfo[0])")
                }
                
            )
    }
}

#Preview {
    GamesView()
}
