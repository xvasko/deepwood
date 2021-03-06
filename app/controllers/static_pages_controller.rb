class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    else
      @user = User.new
    end
  end

  def faq
  end

  def carriers
  end

  def about
  end

  def contact
  end
end
