//
//  BaseResponse.swift
//  MoviesDB
//
//  Created by Anna Słupska on 19/12/2021.
//

import Foundation

struct MovieResponse: Decodable {
  let page: Int
  let results: [Movie]
  let totalPages: Int

  enum CodingKeys: String, CodingKey {
    case page = "page"
    case results = "results"
    case totalPages = "total_pages"
  }
}
