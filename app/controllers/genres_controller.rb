class GenresController < ApplicationController
    def index
		@genres = Genre.all
	end

	def show
		@genre = Genre.find(params[:id])
	end

	def new
		@genre = Genre.new
	end

 
	# def create
	# 	@post = Post.new(params.require(:post).permit(:title, :description))
	# 	@post.save
	# 	redirect_to post_path(@post)
	#   end
	   
	def create
		@genre= Genre.new(genre_params(:name))
		@genre.save
		redirect_to genre_path(@genre)
	  end

	#   def update
	# 	@post = Post.find(params[:id])
	# 	@post.update(params.require(:post).permit(:title))
	# 	redirect_to post_path(@post)
	#   end

	def update
		@genre = Genre.find(params[:id])
		@genre.update(genre_params(:name))
		redirect_to genre_path(@genre)
	  end
	  
	def edit
	  @genre = Genre.find(params[:id])
	end

	private
   # We pass the permitted fields in as *args;
# this keeps `post_params` pretty dry while
# still allowing slightly different behavior
# depending on the controller action. This
# should come after the other methods
	# def post_params
	#   params.require(:post).permit(:title, :description)
	# end

	 
def genre_params(*args)
	params.require(:post).permit(*args)
end
end

 

end
