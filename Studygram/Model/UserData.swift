//
//  UserData.swift
//  Studygram
//
//  Created by Renzo Alvaroshan on 21/07/22.
//

import Firebase
import FirebaseFirestoreSwift

struct UserData: Identifiable, Decodable {
    let email: String
    let username: String
    let fullname: String
    let profileImageURL: String
    @DocumentID var id: String?
    var bio: String?
    var stats: UserStats?
    var isFollowed: Bool? = false
    
    var isCurrentUser: Bool { return AuthViewModel.shared.userSession?.uid == id }
}

struct UserStats: Decodable {
    var following: Int
    var followers: Int
    var posts: Int
}
