//
//  SearchViewModel.swift
//  Studygram
//
//  Created by Renzo Alvaroshan on 21/07/22.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var users = [UserData]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.users = documents.compactMap({ try? $0.data(as: UserData.self) })
        }
    }
    
    func filteredUsers(_ query: String) -> [UserData] {
        let lowercasedQuery = query.lowercased()
        return users.filter({ $0.username.lowercased().contains(lowercasedQuery) || $0.fullname.lowercased().contains(lowercasedQuery) })
    }
}
