//
//  MovieViewModel.swift
//  MoviesDB
//
//  Created by Anna Słupska on 19/12/2021.
//
import Foundation
import Combine

class MovieViewModel: ObservableObject {
  @Published var movies: [Movie] = []
  @Published var configuration: Configuration!

  var currentPage: Int = 1
  private var totalPages: Int = 80
  private var cancellable: AnyCancellable?
  private var configCancellable: AnyCancellable?

  var hasMorePages: Bool {
    return currentPage < totalPages
  }

  func getMovies() {
    cancellable = APIService.shared.getMovies(page: currentPage)
      .receive(on: DispatchQueue.main)
      .sink { completion in
        switch completion {
          case .failure(let error):
            print(error)//TODO: create alert
          case .finished:
            print("finished")
        }
      } receiveValue: { movieResponse in
        self.totalPages = movieResponse.totalPages
        self.movies.append(contentsOf: movieResponse.results)
        self.currentPage += 1
      }
  }

   func fetchConfiguration() {
    configCancellable = APIService.shared.getConfiguration()
      .receive(on: DispatchQueue.main)
      .sink { [weak self] completion in
        switch completion {
          case .failure(let error):
            print(error)//TODO: create alert
          case .finished:
            self?.getMovies()
        }
      } receiveValue: { configurationResponse in
        APIService.shared.configuration = configurationResponse.images
      }
  }
}
