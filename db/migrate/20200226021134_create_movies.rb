class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.integer :tmdb_id
      t.string :title
      t.text :overview
      t.integer :vote_count
      t.text :poster_path
      t.string :release_date

      t.timestamps
    end
  end
end
