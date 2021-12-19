//
//  MoviewDetails.swift
//  MoviesDB
//
//  Created by Anna Słupska on 19/12/2021.
//

import SwiftUI
import URLImage

struct MovieDetails: View {
  let movie: Movie

  var body: some View {
    VStack(spacing: 5) {
      ScrollView {
        URLImage(url: movie.posterUrlPath) {_,_ in
          Image("placeholder")
            .resizable()
            .scaledToFit()
        } content: { image in
          image
            .resizable()
            .scaledToFill()
        }
        Text(movie.overview)
          .padding(2)
          .foregroundColor(.white)
          .font(.system(size: 14))
          .frame(maxWidth: .infinity, alignment: .leading)
      }
      Spacer()
    }
    .background(Color.black)
    .navigationBarTitle(movie.title)
    .font(.system(size: 20))
  }
}

struct MovieDetails_Previews: PreviewProvider {
  static var previews: some View {
    APIService.shared.configuration = Configuration(secureBaseUrl:"https://image.tmdb.org/t/p/")
    let movie = Movie(id: 1, title: "Spiderman", posterPath:nil, backdropPath: "/r2GAjd4rNOHJh6i6Y0FntmYuPQW.jpg", overview: "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.")
    return MovieDetails(movie: movie)
  }
}
