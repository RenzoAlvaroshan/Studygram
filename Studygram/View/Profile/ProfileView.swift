//
//  ProfileView.swift
//  Studygram
//
//  Created by Renzo Alvaroshan on 17/07/22.
//

import SwiftUI

struct ProfileView: View {
    let user: UserData
    @ObservedObject var viewModel: ProfileViewModel
    
    init(user: UserData) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                ProfileHeaderView(viewModel: viewModel)
                
                PostGridView(config: .profile(user.id ?? ""))
                    .padding(.horizontal, 10)
            }.padding(.top)
        }
    }
}
