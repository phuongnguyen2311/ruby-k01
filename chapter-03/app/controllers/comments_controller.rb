class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params)
        if @comment.save
            redirect_to request.referrer
          else
            redirect_to root_url
        end

    end
    def index
        
        redirect_to static_pages_home_path
    end
    private
    def comment_params
       params.require(:comment).permit(:content, :micropost_id, :user_comment_id)
    end
end

