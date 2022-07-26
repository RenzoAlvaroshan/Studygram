//
//  LazyView.swift
//  Studygram
//
//  Created by Renzo Alvaroshan on 26/07/22.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
