//
//  ProfileView.swift
//  GameStream
//
//  Created by Ruben on 12/4/24.
//

import SwiftUI

struct ProfileView: View {
    
    @State var username = "Idril"
    
    var body: some View {
        ZStack {
            Color(.background)
                .ignoresSafeArea()
            VStack {
                
                Text("Perfil")
                    .foregroundStyle(.white)
                    .bold()
                    .frame(
                        minWidth: 0,
                        idealWidth: 100,
                        maxWidth: .infinity,
                        alignment: .center
                    )
                    .padding()
                
                VStack {
                    Image("perfil")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 118, height: 118, alignment: .center)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
                .padding(EdgeInsets(
                    top: 16,
                    leading: 0,
                    bottom: 32,
                    trailing: 0
                ))

                settingsModule()
            }
        }
        .onAppear(
            perform: {
                // cargar mis datos de usuario
                print("Cargando datos de usuario")
            }
        )
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
    }
}

struct settingsModule: View {
    var body: some View {
        Text("Ajustes")
            .foregroundStyle(.white)
            .bold()
            .frame(
                minWidth: 0,
                idealWidth: 100,
                maxWidth: .infinity,
                alignment: .leading
            )
            .padding(.leading, 18)
    }
}

#Preview {
    ProfileView()
}
