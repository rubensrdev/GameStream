//
//  EditProfileView.swift
//  GameStream
//
//  Created by Ruben on 12/4/24.
//

import SwiftUI

struct EditProfileView: View {
    var body: some View {
        ZStack {
            Color(.background)
                .ignoresSafeArea()
            VStack {
                ScrollView {
                    VStack {
                        
                        Text("Edición de perfil")
                            .foregroundStyle(.darkCian)
                            .font(.title)
                            .bold()
                        
                        ZStack {
                            Button(action: {}, label: {
                                Image("perfil")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 118, height: 118)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            })
                            Image(systemName: "camera")
                                .foregroundStyle(.white)
                                .imageScale(.large)
                        }
                    }
                    .padding(.bottom, 18)
                    
                    EditModule()
                }
            }
        }
    }
}

struct EditModule: View {
    
    @State var correo: String = ""
    @State var contraseña: String = ""
    @State var nombre: String = ""
    @State var mostrarContraseña: Bool = false
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Correo electrónico")
                .foregroundStyle(.darkCian)
            ZStack(alignment: .leading) {
                if correo.isEmpty {
                    Text(verbatim: "ejemplo@gmail.com")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                TextField("", text: $correo)
                    .keyboardType(.emailAddress)
            }
            Divider()
                .frame(height: 1)
                .background(.darkCian)
                .padding(.bottom, 12)
            Text("Contraseña")
                .foregroundStyle(.darkCian)
            ZStack(alignment: .leading) {
                HStack {
                    if contraseña.isEmpty {
                        Text("Escribe tu contraseña")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    if mostrarContraseña {
                        TextField("", text: $contraseña)
                            .foregroundStyle(.white)
                    } else {
                        SecureField("", text: $contraseña)
                            .foregroundStyle(.white)
                    }
                    Button(action: cambiarEstadoMostrarContraseña, label: {
                        Image(systemName: "eye.fill")
                            .foregroundStyle(.darkCian)
                    })
                }
            }
            Divider()
                .frame(height: 1)
                .background(.darkCian)
                .padding(.bottom, 12)
            Text("Nombre")
                .foregroundStyle(.darkCian)
            ZStack(alignment: .leading) {
                if nombre.isEmpty {
                    Text("Escribe tu nombre")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                TextField("", text: $nombre)
            }
            Divider()
                .frame(height: 1)
                .background(.darkCian)
                .padding(.bottom, 32)
            
            Button(action: updateData, label: {
                Text("Actualizar datos")
                    .textCase(.uppercase)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(EdgeInsets(
                        top: 11, leading: 18, bottom: 11, trailing: 18
                    ))
                    .overlay(RoundedRectangle(cornerRadius: 6).stroke(.darkCian, lineWidth: 2)
                        .shadow(color: .white, radius: 3)
                    )
            })
            //.navigationDestination(isPresented: $isPantallaHomeActive, destination: {Home()})
            
        }
        .padding(.horizontal, 42)
    }
    
    func updateData() {
        print("Guardado y actualización de datos de usuario")
        let manejadorDatos = SaveData()
        let resultado = manejadorDatos.guardar(correo: correo, contraseña: contraseña, nombre: nombre)
        print("Resultado: \(resultado)")
    }
    
    func cambiarEstadoMostrarContraseña() {
        if mostrarContraseña {
            mostrarContraseña = false
        } else {
            mostrarContraseña = true
        }
    }
    
}

#Preview {
    EditProfileView()
}
