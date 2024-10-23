//
//  PreviewContainer.swift
//  MyBooks
//
//  Created by René Pfammatter on 23.10.2024.
//

import Foundation
import SwiftData

struct Preview {
    let container: ModelContainer
    
    init() {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        do {
            container = try ModelContainer(for: Book.self, configurations: config)
        } catch {
            fatalError("Could not create preview container: \(error)")
        }
    }
    
    func addExamples(_ examples: [Book]) {
        Task { @MainActor in
            examples.forEach { example in
                container.mainContext.insert(example)
            }
        }
        
    }
}
