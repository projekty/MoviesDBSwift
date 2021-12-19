//
//  Movie.swift
//  MoviesDB
//
//  Created by Anna Słupska on 19/12/2021.
//

import Foundation

struct Movie: Decodable {
  let id: Int
  let title: String
  let posterPath: String?
  let backdropPath: String?
  let overview: String

  var imagePath: String? {
    backdropPath ?? posterPath
  }

  var detailsImagePath: String? {
    posterPath ?? backdropPath
  }

  var imageUrlPath: URL {
    guard let configuration = APIService.shared.configuration,
          let imagePath = imagePath,
          let url = URL(string: "\(configuration.secureBaseUrl)w780\(imagePath)") else { return URL(string: "https://bit.ly/3ensJvv")! }
     return url
  }

  var posterUrlPath: URL {
    guard let configuration = APIService.shared.configuration,
          let detailsImagePath = detailsImagePath,
          let url = URL(string: "\(configuration.secureBaseUrl)w780\(detailsImagePath)") else { return URL(string: "https://bit.ly/3ensJvv")! }
     return url
  }

  enum CodingKeys: String, CodingKey {
    case id
    case title = "title"
    case posterPath = "poster_path"
    case overview = "overview"
    case backdropPath = "backdrop_path"
  }
}
