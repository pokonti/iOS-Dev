//
//  RegistrationView.swift
//  wasteManagement
//
//  Created by Aknur Seidazym on 10.05.2024.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack{
            Image("leaf_icon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .padding(.bottom, 30)
            
            VStack{
                TextField("Email", text: $email)
                    .padding()
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(10)
                    .padding(.bottom, 20)
                    .autocapitalization(.none)
                
                TextField("Username", text: $username)
                    .padding()
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(10)
                    .padding(.bottom, 20)
                    .autocapitalization(.none)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(10)
                    .padding(.bottom, 20)
                    .autocapitalization(.none)
            }
            .padding(.horizontal)
            
            
            Button {
                Task {
                    try await viewModel.createUser(withEmail: email, password:password, username:username)
                }
            } label: {
                HStack{
                    Text("SIGN UP")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width - 32,height: 48)
            }
            .background(Color("CardBackground"))
            .cornerRadius(10)
            
            
            Spacer()
            
            Button{
                dismiss()
            } label: {
                HStack {
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(.bold)
                }
                .foregroundColor(.black)
            }
        }
    }
}

#Preview {
    RegistrationView()
}
