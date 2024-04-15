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
                    .font(.title3)
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
    
    @State var isToogleOn = true
    @State var isEditProfileViewActive = false
    
    var body: some View {
        VStack(spacing: 3) {
            Text("Ajustes")
                .font(.title2)
                .textCase(.uppercase)
                .foregroundStyle(.white)
                .bold()
                .frame(
                    minWidth: 0,
                    idealWidth: 100,
                    maxWidth: .infinity,
                    alignment: .leading
                )
                .padding(.leading, 18)
                .padding(.bottom)
          
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                HStack {
                    Text("Cuenta")
                        .foregroundStyle(.white)
                        .font(.title3)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.white)
                        
                }
                .padding()
                
            })
            .background(.blueGray)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .padding(.horizontal, 8)
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                HStack {
                    Text("Notificaciones")
                        .foregroundStyle(.white)
                        .font(.title3)
                    Spacer()
                    Toggle("", isOn: $isToogleOn)
                        
                }
                .padding()
                
            })
            .background(.blueGray)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .padding(.horizontal, 8)
            
            Button(action: { isEditProfileViewActive = true }, label: {
                HStack {
                    Text("Editar Perfil")
                        .foregroundStyle(.white)
                        .font(.title3)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.white)
                        
                }
                .padding()
                
            })
            .background(.blueGray)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .padding(.horizontal, 8)
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                HStack {
                    Text("Califica esta aplicación")
                        .foregroundStyle(.white)
                        .font(.title3)
                    Spacer()
                    Image(systemName: "star")
                        .foregroundStyle(.white)
                        
                }
                .padding()
                
            })
            .background(.blueGray)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .padding(.horizontal, 8)
            
            NavigationLink(
                destination: EditProfileView(),
                isActive: $isEditProfileViewActive,
                label: {
                    EmptyView()
                })
            
        }
    }
}

#Preview {
    ProfileView()
}
