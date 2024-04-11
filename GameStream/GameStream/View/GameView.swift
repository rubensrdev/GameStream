//
//  GameView.swift
//  GameStream
//
//  Created by Ruben on 10/4/24.
//

import SwiftUI
import AVKit
import Kingfisher

struct GameView: View {
    
    var gameData: GameData?
    
    var body: some View {
        VStack {
            video(url: gameData!.url)
                    .frame(height: 300)
                    
                ScrollView {
                    
                    videoInfo(title: gameData!.title, studio: gameData!.studio, contentRaiting: gameData!.contentRaiting, publicationYear: gameData!.publicationYear, description: gameData!.description, platforms: gameData!.platforms, tags: gameData!.tags, galleryImages: gameData!.galleryImages)
                    
                    gallery(images: gameData!.galleryImages)
                    
                    comments()
                    
                }
                .frame(maxWidth: .infinity)
                
        }
        .background(Color(.blueGray).ignoresSafeArea())
        
    }
}

struct video: View {
    var url: String

    init(url: String) {
        self.url = url
    }
    
    var body: some View {
        
        let player = AVPlayer(url: URL(string: url)!)
        
        VideoPlayer(player: AVPlayer(url: URL(string: url)!))
            .ignoresSafeArea()
            .onDisappear(perform: {
                player.pause()
            })
    }
}

struct videoInfo: View {
    var title: String
    var studio: String
    var contentRaiting: String
    var publicationYear: String
    var description: String
    var platforms: [String]
    var tags: [String]
    var galleryImages: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(title)")
                .foregroundStyle(.white)
                .font(.largeTitle)
                .padding(.leading)
            HStack {
                Text("\(studio)")
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                    .padding(.leading)
                Text("\(contentRaiting)")
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                Text("\(publicationYear)")
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
            }
            Text("\(description)")
                .font(.subheadline)
                .foregroundStyle(.white)
                .padding(.top, 5)
                .padding(.leading)
            HStack {
                ForEach(tags, id: \.self) { tag in
                    Text("#\(tag)")
                        .font(.subheadline)
                        .foregroundStyle(.white)
                        .padding(.top, 4)
                        .padding(.leading)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 3)
    }
    
}
    
struct gallery: View {
    var images: [String]
    let grid = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Galería")
                .foregroundStyle(.white)
                .font(.largeTitle)
                .padding(.leading)
            ScrollView(.horizontal) {
                LazyHGrid(rows: grid, spacing: 8) {
                    ForEach(images, id: \.self) { image in
                        KFImage(URL(string: image))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                }
            }
            .frame(height: 180)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 3)
    }
}


struct comments: View {
    var body: some View {
        VStack {
            Text("Comentarios")
                .foregroundStyle(.white)
                .font(.largeTitle)
                .padding(.leading)
            VStack(alignment: .center) {
                HStack {
                    
                    Image("rick")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    VStack {
                        Text("Rick Sanchez")
                            .font(.footnote)
                            .bold()
                            .foregroundStyle(.white)
                        Text("Hace 10 días")
                            .font(.caption)
                            .bold()
                            .foregroundStyle(.white)
                    }
                    .padding(.leading)
                }
                Text("Un gran juego me ha gustado mucho, tiene una buena historia y niveles/misiones desafiantes. ")
                    .foregroundStyle(.white)
                    .font(.footnote)
                    .padding(.top, 5)
                    .padding(.leading)
            }
            .background(.comment)
            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
            .clipShape(RoundedRectangle(cornerRadius: 5))
            
            VStack(alignment: .center) {
                HStack {
                    
                    Image("morty")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                    VStack {
                        Text("Morty Smith")
                            .font(.footnote)
                            .bold()
                            .foregroundStyle(.white)
                        Text("Hace 12 días")
                            .font(.caption)
                            .bold()
                            .foregroundStyle(.white)
                    }
                    .padding(.leading)
                }
                Text("Un gran juego me ha gustado mucho, tiene una buena historia y niveles/misiones desafiantes. ")
                    .foregroundStyle(.white)
                    .font(.footnote)
                    .padding(.top, 5)
                    .padding(.leading)
            }
            .background(.comment)
            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
            .clipShape(RoundedRectangle(cornerRadius: 5))
 
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 3)
    }
}
    


#Preview {
    GameView()
}
