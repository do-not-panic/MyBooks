//
//  MyBooksApp.swift
//  MyBooks
//
//  Created by René Pfammatter on 21.10.2024.
//

import SwiftUI
import SwiftData

@main
struct MyBooksApp: App {
    var body: some Scene {
        WindowGroup {
            BookListView()
        }
        .modelContainer(for: Book.self)
    }
    
    init () {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
