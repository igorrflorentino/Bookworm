//
//  AddBookView.swift
//  Bookworm
//
//  Created by Igor Florentino on 21/05/24.
//

import SwiftUI

struct AddBookView: View {
	@Environment(\.modelContext) var modelContext
	@Environment(\.dismiss) var dismiss
	
	@State private var title = ""
	@State private var author = ""
	@State private var genre = "Unknown"
	@State private var review = ""
	@State private var rating = 3
	
	let allGenres = ["Unknown", "Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
	
	var body: some View {
		Form{
			Section {
				TextField("Title", text: $title)
				TextField("Author", text: $author)
				
				Picker("Genre", selection: $genre) {
					ForEach(allGenres, id: \.self) {
						Text($0)
					}
				}
			}
			Section("Write a review") {
				TextEditor(text: $review)
				RatingView(rating: $rating)
			}
			Section {
				Button("Save"){
					let book = Book(title: title.isEmpty ? "Unknown" : title,
									author: author.isEmpty ? "Unknown" : author,
									genre: genre,
									review: review,
									rating: rating
					)
					modelContext.insert(book)
					dismiss()
				}
			}
		}.navigationTitle("Add Book")
	}
}

#Preview {
    AddBookView()
}
