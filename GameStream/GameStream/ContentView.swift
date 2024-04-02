//
//  ContentView.swift
//  GameStream
//
//  Created by Ruben on 2/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack {
                LogoView()
                InicioYRegistroView()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct LogoView: View {
    var body: some View {
        Image("appLogo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 250)
    }
}

struct InicioYRegistroView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Iniciar Sesión")
                    .textCase(.uppercase)
                    .foregroundStyle(.white)
                Text("Regístrate")
                    .textCase(.uppercase)
                    .foregroundStyle(.white)
            }
        }
    }
}
