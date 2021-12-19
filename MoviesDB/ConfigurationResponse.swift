//
//  Configuration.swift
//  MoviesDB
//
//  Created by Anna Słupska on 19/12/2021.
//

import Foundation

struct ConfigurationResponse: Decodable {
  let images: Configuration

  enum CodingKeys: String, CodingKey {
    case images = "images"
  }
}
