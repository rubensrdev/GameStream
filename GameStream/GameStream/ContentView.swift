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
            Spacer()
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
            .padding(.bottom, 40)
    }
}

struct InicioYRegistroView: View {
    
    @State var tipoInicioSesion = true
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    print("Pantalla de inicio de sesión")
                    tipoInicioSesion = true
                }, label: {
                    Text("Iniciar sesión")
                        .textCase(.uppercase)
                })
                .foregroundStyle(tipoInicioSesion ? .white : .gray)
                Spacer()
                Button(action: {
                    print("Pantalla de registro")
                    tipoInicioSesion = false
                }, label: {
                    Text("Regístrate")
                        .textCase(.uppercase)
                })
                .foregroundStyle(tipoInicioSesion ? .gray : .white)
                Spacer()
            }
            Spacer(minLength: 42)
            if tipoInicioSesion { // pantalla inicio de sesión
                InicioSesionView()
            } else { // pantalla de registro
                RegistroView()
            }
        }
    }
}

struct InicioSesionView: View {
    var body: some View {
        Text("Pantalla de inicio de sesión")
            .foregroundStyle(.white)
    }
}

struct RegistroView: View {
    var body: some View {
        Text("Pantalla de registro")
            .foregroundStyle(.white)
    }
}
