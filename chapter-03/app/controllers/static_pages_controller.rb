class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.newest.paginate page: params[:page]
      @home_page = true
      @friends = User.where.not(id: current_user.id).paginate(page: 1, per_page: 4)
      @total_pages = @friends.total_pages
      @next_page = 2
    end
  end

  def help
  end

  def contact
  end
end
