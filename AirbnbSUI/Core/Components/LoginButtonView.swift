//
//  LoginButtonView.swift
//  AirbnbSUI
//
//  Created by Dmitry Volkov on 15/01/2025.
//

import SwiftUI

struct LoginButtonView: View {
    var body: some View {
        Text("Log in")
            .foregroundStyle(.white)
            .font(.subheadline)
            .fontWeight(.semibold)
            .frame(width: 360, height: 48)
            .background(.pink)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    LoginButtonView()
}
