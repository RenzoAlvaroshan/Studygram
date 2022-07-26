//
//  Comment.swift
//  Studygram
//
//  Created by Renzo Alvaroshan on 23/07/22.
//

import Firebase
import FirebaseFirestoreSwift

struct Comment: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let postOwnerUid: String
    let profileImageURL: String
    let commentText: String
    let timestamp: Timestamp
    let uid: String
    
    var timestampString: String? {
        TimestampString.timestampString(dateValue: timestamp.dateValue())
    }
}
