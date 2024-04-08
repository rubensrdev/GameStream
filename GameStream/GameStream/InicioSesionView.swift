//
//  InicioSesionView.swift
//  GameStream
//
//  Created by Ruben on 8/4/24.
//

import SwiftUI

struct InicioSesionView: View {
    
    @State var correo = ""
    @State var contraseña = ""
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading) {
                
                Text("Correo Electrónico")
                    .foregroundStyle(.darkCian)
                
                ZStack(alignment: .leading) {
                    
                    if correo.isEmpty {
                        Text("ejemplo@email.com")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    
                    TextField("", text: $correo)
                        .foregroundStyle(.white)
                        .keyboardType(.emailAddress)
                }
                
                Divider()
                    .frame(height: 2)
                    .background(.darkCian)
                    .padding(.bottom)
                
                Text("Contraseña")
                    .foregroundStyle(.darkCian)
                
                ZStack(alignment: .leading) {
                    if contraseña.isEmpty {
                        Text("Escribe tu contraseña")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    SecureField("", text: $contraseña)
                        .foregroundStyle(.white)
                        
                }
                
                Divider()
                    .frame(height: 2)
                    .background(.darkCian)
                    .padding(.bottom)
                
                Text("¿Olvidaste tu contraseña?")
                    .font(.footnote)
                    .frame(width: 300, alignment: .trailing)
                    .foregroundStyle(.darkCian)
                    .padding(.bottom)
                
                Button(action: iniciarSesion, label: {
                    Text("Iniciar Sesión")
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
                
                Text("Inicia sesión con redes sociales")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(EdgeInsets(
                        top: 11, leading: 18, bottom: 11, trailing: 18
                    ))
                
                HStack {
                    
                    Button(action: iniciarSesionFacebook,
                           label: { Text("Facebook")
                            .frame(width: 100, height: 40)
                    })
                    .foregroundStyle(.white)
                    .background(.blueGray)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(EdgeInsets(
                        top: 11, leading: 18, bottom: 11, trailing: 18
                    ))
                    
                    
                    Button(action: iniciarSesionX,
                           label: {Text("X")
                            .frame(width: 100, height: 40)
                    })
                    .foregroundStyle(.white)
                    .background(.blueGray)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(EdgeInsets(
                        top: 11, leading: 18, bottom: 11, trailing: 18
                    ))

                    
                }
                
            }
            .padding(.horizontal, 77)
            
        }
        
    }
    
    func iniciarSesion() {
        print("Pulsado botón de Iniciar Sesión")
    }
    
    func iniciarSesionFacebook() {
        print("Pulsado botón de iniciar sesión con Facebook")
    }
    
    func iniciarSesionX() {
        print("Pulsado botón de inciar sesión con X")
    }
    
}

#Preview {
    InicioSesionView()
}
