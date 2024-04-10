//
//  GamesView.swift
//  GameStream
//
//  Created by Ruben on 10/4/24.
//

import SwiftUI

struct GamesView: View {
    var body: some View {
        Text("Pantalla JUEGOS")
            .font(.title)
            .bold()
            .fontDesign(.rounded)
            .onAppear(
                
                perform: {
                    print("Primer elemento del json")
                }
                
            )
    }
}

#Preview {
    GamesView()
}
