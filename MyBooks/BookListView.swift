//
//  ContentView.swift
//  MyBooks
//
//  Created by René Pfammatter on 21.10.2024.
//

import SwiftUI
import SwiftData

enum SortOrder: String, CaseIterable, Identifiable {
    case status, title, author
    
    var id: Self { self }
}

struct BookListView: View {

    @State private var createNewBook = false
    @State private var sortOrder: SortOrder = .status
    @State private var filter = ""
    
    var body: some View {
        NavigationStack {
            Picker("", selection: $sortOrder) {
                ForEach(SortOrder.allCases) { sortOrder in
                    Text("Sort by \(sortOrder.rawValue)").tag(sortOrder)
                }
            }
            .buttonStyle(.bordered)
            BookList(sortOrder: sortOrder, filterString: filter)
                .searchable(text: $filter, prompt: Text("Filter on title or author"))
            .navigationTitle("My Books")
            .toolbar {
                Button {
                    createNewBook = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .imageScale(.large)
                }
            }
            .sheet(isPresented: $createNewBook) {
                NewBookView()
                    .presentationDetents([.medium])
            }
        }
    }
}

#Preview {
    let preview = Preview(Book.self)
    preview.addExamples(Book.sampleBooks)
    
    return BookListView()
        .modelContainer(preview.container)
}
