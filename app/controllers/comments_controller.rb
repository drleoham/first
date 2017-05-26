class CommentsController < ApplicationController

    def create

        comment = Comment.new
        comment.content = params[:content]
        comment.post_id = params[:post_id]
        comment.user_id = current_user.id
        comment.save

        redirect_to '/'
    end

    def destroy
      comment = Comment.find(params[:cid])
      comment.destroy

      redirect_to '/'
    end

    def edit
      @comment = Comment.find(params[:cid])
    end

    def update
      comment = Comment.find(params[:post_id])
      comment.post_id = params[:post_id]
      comment.user_id = current_user.id
      comment.content = params[:content]
      comment.save

      redirect_to '/'
    end
end
