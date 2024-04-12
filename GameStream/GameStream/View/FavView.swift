//
//  FavView.swift
//  GameStream
//
//  Created by Ruben on 12/4/24.
//

import SwiftUI
import AVKit

struct FavView: View {
    
    @ObservedObject var allGames = ViewModel()
    
    var body: some View {
        ZStack {
            Color(.background).ignoresSafeArea()
            VStack {
                Text("Favoritos")
                    .textCase(.uppercase)
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.bottom, 9)
                
                ScrollView {
                    
                    VStack(spacing: 0) {
                        ForEach(allGames.gamesInfo, id: \.self) { game in
                            VideoPlayer(player: AVPlayer(url: URL(string: game.videosUrls.mobile)!))
                                .frame(height: 200)
                            Text("\(game.title)")
                                .font(.title3)
                                .foregroundStyle(.white)
                                //.background(.blueGray)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                            
                        }
                    }
                    
                }
                .padding(.bottom, 8)
                
            }
            .padding(.horizontal, 6)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    FavView()
}
