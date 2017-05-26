class PostsController < ApplicationController

    before_action :authenticate_user!, except: [:index]

    def index
        @posts = Post.all.reverse
    end

    def new
    end

    def create

      post = Post.new
      post.title = params[:title]
      post.content = params[:content]
      post.user_id = current_user.id
      # post.user = current_user
      uploader = BrisbaneUploader.new
      uploader.store!(params[:image_file])

      post.image_url = uploader.url
      post.thumb_image_url = uploader.thumb.url
      post.save

      if post.save
        redirect_to '/'
      else
        flash[:error] = post.errors.messages[:title][0]
      render 'new'
      end
    end

    def destroy
        post = Post.find(params[:post_id])
        post.destroy

        redirect_to '/'
    end

    def edit
        @post = Post.find(params[:post_id])
    end

    def update
      post = Post.find(params[:post_id])
      post.title = params[:title]
      post.content = params[:content]
      post.save

      redirect_to '/'
    end

end
