class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.newest.paginate page: params[:page]
      @home_page = true
      following_id = current_user.following.pluck(:id)
      following_id << current_user.id
      @friends = User.where.not(id: following_id).paginate(page: params[:page], per_page: 4)
      @total_pages = @friends.total_pages
      @next_page = 2
    end
  end

  def help
  end

  def contact
  end
end
