# frozen_string_literal: true

namespace :movies do
  desc "It records the upcoming movies from The Movie Database (TMDb)"

  task upcoming: :environment do
    puts "Importing upcoming movies from The Movie Database (TMDb)"

    upcoming_movies = TMDb::Movie.upcoming

    upcoming_movies.each do |movie|
      Movie.find_or_initialize_by(tmdb_id: movie.id)
        .update(
          title: movie.title,
          overview: movie.overview,
          vote_count: movie.vote_count,
          poster_path: movie.poster_path,
          release_date: movie.release_date
        )
    end
  end
end
