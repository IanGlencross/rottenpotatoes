class MoviesController < ApplicationController
  helper_method :sort_column
#  @all_ratings = ['G','PG','PG-13','R']

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @all_ratings = ['G','PG','PG-13','R']	
    @movies = Movie.where(:rating => ratings_chosen).order(sort_column)
#    @movies = Movie.order(sort_column)
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end
  
  private

	def sort_column
		params[:sort] || "title"  # sorts by title by default
	end
	
	def ratings_chosen
	  @rating_hash = params[:ratings] || @all_ratings
	  @rating_hash.to_a
	  #@rating_hash.keys
	end
#can add another helper_method for sort direction based on railscasts#228
end
