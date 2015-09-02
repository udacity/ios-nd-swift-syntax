//
// This file (and all other Swift source files in the Sources directory of this playground) will be precompiled into a framework which is automatically made available to Classes_Properties_Methods.playground.
//


import UIKit

class Movie {
    let title: String
    let director: String
    let releaseYear: Int
    
    init(title: String, director:String, releaseYear: Int) {
        self.title = title
        self.director = director
        self.releaseYear = releaseYear
    }
}

class MovieArchive {
    var movies:[Movie]
    
    func filterByYear(year:Int, movies: [Movie]) -> [Movie] {
        var filteredArray = [Movie]()
        for movie in movies {
            if movie.releaseYear == year {
                filteredArray.append(movie)
            }
        }
        return filteredArray
    }
    
    init(movies:[Movie]) {
        self.movies = movies
    }
}
