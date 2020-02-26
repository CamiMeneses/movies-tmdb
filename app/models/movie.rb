class Movie < ApplicationRecord
  validates_presence_of :tmdb_id, :title, :overview, :vote_count, :poster_path, :release_date
end
