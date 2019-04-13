class StaticPagesController < ApplicationController
  def home
    @micropost = current_user.microposts.build if loggged_in?
    
  end
end
