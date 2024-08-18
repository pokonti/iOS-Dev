//
//  ProfileView.swift
//  wasteManagement
//
//  Created by Aknur Seidazym on 10.05.2024.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        if let user = viewModel.currentUser {
            VStack(spacing: 20) {

                Text(user.username)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.top, 20)


                Divider()

                ProfileInfo(iconName: "envelope.fill", title: "Email", value: user.email)
                
                Button {
                    viewModel.signOut()
                } label: {
                    HStack{
                        Text("Sign out")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: 200, height: 48)
                }
                .background(Color("CardBackground"))
                .cornerRadius(10)
                

            }
            .padding()
            .navigationTitle("Profile")
            
            
            
            
        }
        
    }
}


struct ProfileInfo: View {
    var iconName: String
    var title: String
    var value: String

    var body: some View {
        HStack {
            VStack(spacing: 4) {
                HStack{
                    Text(title)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Image(systemName: iconName)
                }
                Text(value)
                    .font(.body)
                    .foregroundColor(.black)
            }
            .frame(width: 200)
            
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)
    }
}



#Preview {
    ProfileView()
}
