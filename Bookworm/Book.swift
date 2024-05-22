//
//  Book.swift
//  Bookworm
//
//  Created by Igor Florentino on 21/05/24.
//

import Foundation
import SwiftData

@Model
class Book{
	var title: String
	var author: String
	var genre: String
	var review: String
	var rating: Int
	var creationDate: Date
	
	init(title: String, author: String, genre: String, review: String, rating: Int, creationDate: Date = Date.now) {
		self.title = title
		self.author = author
		self.genre = genre
		self.review = review
		self.rating = rating
		self.creationDate = creationDate
	}
}
