//
//  StudygramApp.swift
//  Studygram
//
//  Created by Renzo Alvaroshan on 17/07/22.
//

import SwiftUI
import Firebase

@main
struct StudygramApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
