//
//  EditProfileView.swift
//  Studygram
//
//  Created by Renzo Alvaroshan on 26/07/22.
//

import SwiftUI

struct EditProfileView: View {
    @State private var bioText = ""
    @ObservedObject private var viewModel: EditProfileViewModel
    @Binding var user: UserData
    @Environment(\.presentationMode) var mode
    
    init(user: Binding<UserData>) {
        self._user = user
        self.viewModel = EditProfileViewModel(user: self._user.wrappedValue)
        self._bioText = State(initialValue: _user.wrappedValue.bio ?? "")
    }
    
    var body: some View {
        VStack {
            HStack {
                Button { mode.wrappedValue.dismiss() } label: {
                    Text("Cancel")
                }
                
                Spacer()
                
                Button { viewModel.saveUserBio(bioText) } label: {
                    Text("Done").bold()
                }
            }.padding()
            
            TextArea(text: $bioText, placeholder: "Add your bio..")
                .frame(width: 370, height: 200)
            
            Spacer()
        }
        .onReceive(viewModel.$uploadComplete) { completed in
            if completed {
                self.mode.wrappedValue.dismiss()
                self.user.bio = viewModel.user.bio
            }
        }
    }
}
