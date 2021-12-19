//
//  ContentView.swift
//  MoviesDB
//
//  Created by Anna Słupska on 19/12/2021.
//

import SwiftUI
import URLImage

struct ContentView: View {
  @ObservedObject private var viewModel = MovieViewModel()

  init() {
    UITableView.appearance().showsVerticalScrollIndicator = false
    UITableView.appearance().separatorStyle = .none
  }

  var body: some View {
    return NavigationView {
      List {
        ForEach(viewModel.movies, id: \.id) { movie in
          ZStack {
            MovieRow(movie: movie)
            NavigationLink(destination: MovieDetails(movie: movie)) {}
              .buttonStyle(PlainButtonStyle()).opacity(0)
          }
          .listRowInsets(EdgeInsets(top: 0, leading: 5, bottom: 5, trailing: 5))
        }
        if self.viewModel.hasMorePages {
          Text("Fetching more...")
            .onAppear(perform: {
              if self.viewModel.currentPage > 1 {
                self.viewModel.getMovies()
              }
            })
        }
      }
      .onAppear {
        URLImageService.shared.cleanup()
        fetchData()
      }
      .navigationTitle("Movies")
    }
  }

  private func fetchData() {
    viewModel.fetchConfiguration()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
