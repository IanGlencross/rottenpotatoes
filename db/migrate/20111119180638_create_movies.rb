class CreateMovies < ActiveRecord::Migration
  def up
    create_table :movies do |t|
      t.string :title
      t.string :rating
      t.text :description
<<<<<<< HEAD:db/migrate/20111119180638_create_movies.rb
      t.datetime :release_date
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
=======
      t.date :release_date
>>>>>>> 6aae79b8a3fe208d175189f1fed7cb7c9d1555b3:db/migrate/20110909213200_create_movies.rb
      t.timestamps
    end
  end

  def down
    drop_table :movies
  end
end
