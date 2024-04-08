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
    
    @State var tipoInicioSesion = false
    
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
    
    @State private var correo = ""
    @State private var contraseña = ""
    
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
                
                InicioSesionRedesSocialesView()
                
            }
            .padding(.horizontal, 77)
            
        }
        
    }
    
    func iniciarSesion() {
        print("Pulsado botón de Iniciar Sesión")
    }
    
}

struct RegistroView: View {
    
    @State private var correo = ""
    @State private var contraseña = ""
    @State private var confirmarContraseña = ""
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .center) {
                
                Text("Elige una foto de perfil")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.white)
                
                Text("Puedes cambiar o elegirla más adelante")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundStyle(.gray)
                    .padding(.bottom)
                
                Button(action: subirFoto, label: {
                    ZStack {
                        
                        Image("perfil")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                        
                        Image(systemName: "camera.fill")
                            .foregroundStyle(.white)
                        
                    }
                })
                .padding(.bottom)
                
            }
            
            VStack(alignment: .leading) {
                
                Text("Correo Electrónico *")
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
                
                Text("Contraseña *")
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
                
                Text("Confirmar contraseña *")
                    .foregroundStyle(.darkCian)
                
                ZStack(alignment: .leading) {
                    if contraseña.isEmpty {
                        Text("Vuelve a escribir tu contraseña")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    SecureField("", text: $confirmarContraseña)
                        .foregroundStyle(.white)
                        
                }
                
                Divider()
                    .frame(height: 2)
                    .background(.darkCian)
                    .padding(.bottom)
                
                Button(action: registrarse, label: {
                    Text("Registrarse")
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

                InicioSesionRedesSocialesView()
                
            }
            .padding(.horizontal, 77)
            
        }
        
    }
    
    func subirFoto() {
        print("pulsado botón de subir foto")
    }
    
    func registrarse() {
        print("Pulsado botón de Iniciar Sesión")
    }
    
}

struct InicioSesionRedesSocialesView: View {
    var body: some View {
        
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
    
    func iniciarSesionFacebook() {
        print("Pulsado botón de iniciar sesión con Facebook")
    }
    
    func iniciarSesionX() {
        print("Pulsado botón de inciar sesión con X")
    }
}
