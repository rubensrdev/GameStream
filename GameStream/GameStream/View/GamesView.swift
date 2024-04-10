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
    @State var title: String = ""
    @State var studio: String = ""
    @State var contentRaiting: String = ""
    @State var publicationYear: String = ""
    @State var description: String = ""
    @State var platforms: [String] = []
    @State var tags: [String] = []
    @State var galleryImages: [String] = []
    
    let formGrid = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        ZStack {
            Color(.blueGray).ignoresSafeArea()
            VStack{
                
                Text("Juegos")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 64, trailing: 0))
                
                ScrollView {
                    
                    LazyVGrid(columns: formGrid,spacing: 8 ,content: {
                        ForEach(games.gamesInfo, id: \.self) {
                            game in
                            
                            Button(action: {
                                url = game.videosUrls.mobile
                                title = game.title
                                studio = game.studio
                                contentRaiting = game.contentRaiting
                                publicationYear = game.publicationYear
                                description = game.description
                                platforms = game.platforms
                                tags = game.tags
                                galleryImages = game.galleryImages
                                print("Pulsado el juego: \(title)")
                            }, label: {
                                Text("\(game.title)")
                                    .foregroundStyle(.white)
                            })
                            
                        }
                    })
                    
                }
                
            }
            .padding(.horizontal, 6)
        }
    }
}

#Preview {
    GamesView()
}
