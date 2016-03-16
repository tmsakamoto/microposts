class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build #micropostのform用
      #@comment = current_user.comments.build #コメント入力欄
      
      
      
      @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc).page(params[:page]).per(5)
    end
  end
end
