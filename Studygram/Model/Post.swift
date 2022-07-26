//
//  Post.swift
//  Studygram
//
//  Created by Renzo Alvaroshan on 23/07/22.
//

import FirebaseFirestoreSwift
import Firebase

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let imageURL: String
    var likes: Int
    let ownerUid: String
    let ownerImageURL: String
    let ownerUsername: String
    let timestamp: Timestamp
    
    var didLike: Bool? = false
}
