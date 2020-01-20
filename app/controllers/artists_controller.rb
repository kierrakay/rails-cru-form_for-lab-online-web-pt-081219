class ArtistsController < ApplicationController
    def index
		@artists= Artist.all
	end

	def show
		@artist= Artist.find(params[:id])
	end

	def new
		@artist = Artist.new
	end

 
	# def create
	# 	@post = Post.new(params.require(:post).permit(:title, :description))
	# 	@post.save
	# 	redirect_to post_path(@post)
	#   end
	   
	def create
		@artist= Artist.new(artist_params(:name, :bio))
		@artist.save
		redirect_to artist_path(@artist)
	  end

	#   def update
	# 	@post = Post.find(params[:id])
	# 	@post.update(params.require(:post).permit(:title))
	# 	redirect_to post_path(@post)
	#   end

	def update
		@artist = Artist.find(params[:id])
		@artist.update(artist_params(:name, :bio))
		redirect_to artist_path(@artist)
	  end
	  
	def edit
	  @artist = Artist.find(params[:id])
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

	 
def artist_params(*args)
	params.require(:post).permit(*args)
end
end

 

end
