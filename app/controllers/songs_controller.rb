class SongsController < ApplicationController
    def index
		@songs = Song.all
	end

	def show
		@song =Song.find(params[:id])
	end

	def new
		@song = Song.new
	end

 
	# def create
	# 	@post = Post.new(params.require(:post).permit(:title, :description))
	# 	@post.save
	# 	redirect_to post_path(@post)
	#   end
	   
	def create
		@song = Song.new(song_params(:name, :artist_id, :genre_id))
		@song.save
		redirect_to song_path(@song)
	  end

	#   def update
	# 	@post = Post.find(params[:id])
	# 	@post.update(params.require(:post).permit(:title))
	# 	redirect_to post_path(@post)
	#   end

	def update
		@song = Song.find(params[:id])
		@song.update(song_params(:name, :artist_id, :genre_id))
		redirect_to song_path(@song)
	  end
	  
	def edit
	  @song = Song.find(params[:id])
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

	 
def song_params(*args)
	params.require(:post).permit(*args)
end
end

 

end
