//
//  MovieRow.swift
//  MoviesDB
//
//  Created by Anna Słupska on 19/12/2021.
//

import SwiftUI
import URLImage

struct ImageOverlay: View {
  let title: String
  let subtitle: String

  var body: some View {
    ZStack {
      VStack {
        Text(title)
          .padding(2)
          .foregroundColor(.white)
          .font(.system(size: 14, weight: .bold))
          .frame(maxWidth: .infinity, alignment: .leading)
          .lineLimit(2)
        Text(subtitle)
          .padding(2)
          .foregroundColor(.white)
          .font(.system(size: 12))
          .frame(maxWidth: .infinity, alignment: .leading)
          .lineLimit(3)
      }
      .background(Color.black.opacity(0.6))
    }
  }
}

struct MovieRow: View {
  let movie: Movie
  var body: some View {
    VStack(spacing: 5) {
      URLImage(url: movie.imageUrlPath) {_,_ in
        Image("placeholder")
          .resizable()
          .scaledToFit()
          .cornerRadius(6.0)
      } content: { image in
        image
          .resizable()
          .scaledToFit()
          .overlay(ImageOverlay(title: movie.title, subtitle: movie.overview), alignment: .bottomLeading)
          .cornerRadius(6.0)
      }
    }
  }
}

struct MovieRow_Previews: PreviewProvider {
  static var previews: some View {
    APIService.shared.configuration = Configuration(secureBaseUrl:"https://image.tmdb.org/t/p/")
    let mockMovie = Movie(id: 1, title: "Spiderman", posterPath: "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg", backdropPath: nil, overview: "Peter Parker ")
    return MovieRow(movie: mockMovie)
  }
}
