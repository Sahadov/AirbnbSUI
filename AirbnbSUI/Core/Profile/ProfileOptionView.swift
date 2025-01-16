//
//  ProfileOptionView.swift
//  AirbnbSUI
//
//  Created by Dmitry Volkov on 15/01/2025.
//

import SwiftUI

struct ProfileOptionView: View {
    var title: String
    var image: String
    
    var body: some View {
        HStack {
            Label(title, systemImage: image)
                .fontWeight(.semibold)
            Spacer()
            Image(systemName: "chevron.right")
        }
    }
}


