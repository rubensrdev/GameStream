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
    var body: some View {
        VStack {
            
        }
    }
}

#Preview {
    EditProfileView()
}
