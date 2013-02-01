class Movie < ActiveRecord::Base
  def ratings
	@all_ratings = ['G','PG','PG-13','R']
  end
end
