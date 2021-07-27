class PostsController < ApplicationController
    def index
        @posts = Post.all
        #render json: @posts, root: "some_posts"
        render json: { posts: @posts}
      end
end
