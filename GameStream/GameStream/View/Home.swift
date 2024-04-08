//
//  Home.swift
//  GameStream
//
//  Created by Ruben on 8/4/24.
//

import SwiftUI

struct Home: View {
    
    @State private var tabSeleccionado: Int = 2
    
    var body: some View {
        TabView(selection: $tabSeleccionado) {
            
            Text("Pantalla PERFIL")
                .font(.title)
                .bold()
                .fontDesign(.rounded)
                .tabItem {
                    Image(systemName: "person")
                    Text("Perfil")
                }
                .tag(0)
            
            Text("Pantalla JUEGOS")
                .font(.title)
                .bold()
                .fontDesign(.rounded)
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Perfil")
                }
                .tag(1)
            
            HomeTab()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(2)

            Text("Pantalla FAVORITOS")
                .font(.title)
                .bold()
                .fontDesign(.rounded)
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favoritos")
                }
                .tag(3)
            
        }
        .onAppear() {
            UITabBar.appearance().backgroundColor = UIColor(Color("TabBarColor"))
            UITabBar.appearance().unselectedItemTintColor = .gray
            UITabBar.appearance().isTranslucent = true
        }
        .tint(.white)
        
    }
}

struct HomeTab: View {
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack {
                Text("Pantalla HOME with TAB")
                    .font(.title)
                    .bold()
                    .fontDesign(.rounded)
                    .foregroundStyle(.white)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    Home()
}
