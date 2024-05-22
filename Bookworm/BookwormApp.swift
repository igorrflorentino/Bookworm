//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Igor Florentino on 16/05/24.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
		}.modelContainer(for: Book.self)
    }
}
