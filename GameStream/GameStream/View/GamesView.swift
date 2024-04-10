//
//  GamesView.swift
//  GameStream
//
//  Created by Ruben on 10/4/24.
//

import SwiftUI
import Kingfisher

struct GamesView: View {
    
    @ObservedObject var games = ViewModel()
    
    @State var gameViewIsActive: Bool = false
    @State var gameData: GameData? = nil
    
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
                                gameData = GameData(game: game)
                                gameViewIsActive = true
                            }, label: {
                                KFImage(URL(string: game.galleryImages[0])!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                    .padding(.bottom, 12)
                                /*
                                AsyncImage(url: URL(string: "\(game.videosUrls.mobile)"))
                                    .frame(width: 200, height: 200)
                                 */
                            })
                            
                        }
                    })
                    
                }
                
            }
            .padding(.horizontal, 6)
            
            NavigationLink(
                destination: GameView(gameData: gameData),
                isActive: $gameViewIsActive,
                label: {
                    EmptyView()
                })
            
        }
    }
}

#Preview {
    GamesView()
}
