//
//  APIService.swift
//  MoviesDB
//
//  Created by Anna Słupska on 19/12/2021.
//
import Foundation
import Combine

final class APIService {
  private let ApiKey = "2bb6f8772a2010357641a07b3a40d89d"
  private let timeout: TimeInterval = 15
  static let shared = APIService()

  @Published var configuration: Configuration?

  func getMovies(page: Int) -> AnyPublisher<MovieResponse, Error> {
    var components = URLComponents(string: "https://api.themoviedb.org/3/movie/now_playing")!
    components.queryItems = [
      URLQueryItem(name: "api_key", value: "\(ApiKey)"),
      URLQueryItem(name: "page", value: "\(page)")
    ]

    let request = URLRequest(url: components.url!, timeoutInterval: timeout)
    return URLSession.shared.dataTaskPublisher(for: request)
      .map(\.data)
      .decode(type: MovieResponse.self, decoder: JSONDecoder())
      .eraseToAnyPublisher()
  }
  
  func getConfiguration() -> AnyPublisher<ConfigurationResponse, Error> {
    var components = URLComponents(string: "https://api.themoviedb.org/3/configuration")!
    components.queryItems = [
      URLQueryItem(name: "api_key", value: "\(ApiKey)"),
    ]
    let request = URLRequest(url: components.url!, timeoutInterval: timeout)
    return URLSession.shared.dataTaskPublisher(for: request)
      .map(\.data)
      .decode(type: ConfigurationResponse.self, decoder: JSONDecoder())
      .eraseToAnyPublisher()
  }
}
