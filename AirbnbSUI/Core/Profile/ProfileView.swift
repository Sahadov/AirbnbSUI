//
//  ProfileView.swift
//  AirbnbSUI
//
//  Created by Dmitry Volkov on 15/01/2025.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Profile")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text("Log in to start planning your next trip")
            }
            
            Button { } label: {
                LoginButtonView()
        }
            
            HStack {
                Text("Don't have an account?")
                Button {
                    
                } label: {
                    Text("Sign up")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                        .underline()
                }
            }
            .font(.caption)
            
            ProfileOptionView(title: "Settings", image: "gear")
            ProfileOptionView(title: "Accessibility", image: "gear")
            ProfileOptionView(title: "Visit the help center", image: "questionmark.circle")
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
