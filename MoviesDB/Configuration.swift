//
//  configuration.swift
//  MoviesDB
//
//  Created by Anna Słupska on 19/12/2021.
//

import Foundation

struct Configuration: Decodable {
  let secureBaseUrl: String
//  let backdropSizes: [String]

  enum CodingKeys: String, CodingKey {
    case secureBaseUrl = "secure_base_url"
//    case backdropSizes = "backdrop_sizes"
  }
}
