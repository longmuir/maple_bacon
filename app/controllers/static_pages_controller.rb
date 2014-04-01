class StaticPagesController < ApplicationController
  def home
    if signed_in?
      redirect_to current_user
    else
      redirect_to piggy_path
    end
  end

  def about
  end
  
  def piggy
  end


end
