class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create]
  
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to :back
    else
      redirect_to :back
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content, :micropost_id, :user_id)
  end
end
