//
//  ProfileActionButtonView.swift
//  Studygram
//
//  Created by Renzo Alvaroshan on 19/07/22.
//

import SwiftUI

struct ProfileActionButtonView: View {
    @ObservedObject var viewModel: ProfileViewModel
    var isFollowed: Bool { return viewModel.user.isFollowed ?? false }
    @State var showEditProfile = false
    
    var body: some View {
        if viewModel.user.isCurrentUser {
            Button(action: { showEditProfile.toggle() }) {
                Text("Edit Profile")
                    .font(.system(size: 15, weight: .semibold))
                    .frame(width: 360, height: 32)
                    .foregroundColor(.black)
                    .overlay {
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(.gray, lineWidth: 1)
                    }
            }.sheet(isPresented: $showEditProfile) {
                EditProfileView(user: $viewModel.user)
            }
            
        } else {
            HStack {
                Button(action: { isFollowed ? viewModel.unfollow() : viewModel.follow() }) {
                    Text(isFollowed ? "Following" : "Follow")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(isFollowed ? .black : .white)
                        .background(isFollowed ? Color.white : Color.blue)
                        .overlay {
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(.gray, lineWidth: isFollowed ? 1 : 0)
                        }
                }.cornerRadius(3)
                
                Button(action: {}) {
                    Text("Message")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(.black)
                        .overlay {
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(.gray, lineWidth: 1)
                        }
                }
            }
        }
    }
}
