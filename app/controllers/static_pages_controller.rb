class StaticPagesController < ApplicationController
  
  skip_before_action :logged_in_user, only: [:home]
  
  def home
  end
end
