//
//  EditProfileViewModel.swift
//  Studygram
//
//  Created by Renzo Alvaroshan on 26/07/22.
//

import SwiftUI

class EditProfileViewModel: ObservableObject {
    var user: UserData
    @Published var uploadComplete = false
    
    init(user: UserData) {
        self.user = user
    }
    
    func saveUserBio(_ bio: String) {
        guard let uid = user.id else { return }
        COLLECTION_USERS.document(uid).updateData(["bio": bio]) { _ in
            self.user.bio = bio
            self.uploadComplete = true
        }
    }
}
