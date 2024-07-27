//
//  ContentView.swift
//  Bookworm
//
//  Created by Igor Florentino on 16/05/24.
//

import SwiftUI
import SwiftData


struct ContentView: View {
	@Environment(\.modelContext) var modelContext
	@Query(sort: [
		SortDescriptor(\Book.title),
		SortDescriptor(\Book.author)
	]) var books: [Book]
	
	@State private var showAddBookView = false
	
	var body: some View {
		NavigationStack{
			List{
				ForEach(books) {book in
					NavigationLink(value: book){
						HStack{
							EmojiRatingView(rating: book.rating)
								.font(.largeTitle)
							VStack(alignment: .leading, content: {
								Text(book.title)
									.font(.headline)
									.foregroundStyle(book.rating == 1 ? .red : .primary)
								Text(book.author)
									.foregroundStyle(.secondary)
							})
						}
					}.navigationDestination(for: Book.self) { book in
						DetailView(book: book)
					}
				}
				.onDelete(perform: { indexSet in
					deleteBooks(at: indexSet)
				})
			}
			.toolbar(content: {
				ToolbarItem(placement: .topBarTrailing) {
					Button("Add Book", systemImage: "plus") {
						showAddBookView = true
					}
				}
				ToolbarItem(placement: .topBarLeading){
					EditButton()
				}
			})
			.sheet(isPresented: $showAddBookView, content: {
				AddBookView()
			})
		}
	}
	
	func deleteBooks(at offsets: IndexSet){
		for offset in offsets {
			let book = books[offset]
			modelContext.delete(book)
		}
	}
	
}

#Preview {
	ContentView()
		.modelContainer(for: Book.self)
}
