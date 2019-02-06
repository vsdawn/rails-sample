class StaticPagesController < ApplicationController
  def home
  	if(current_user)
  		redirect_to dashboard_path
  	else
  		
    end
   end

  def help
  end

  def about
  end

  def contact
  end
  def dashboard
  end
end
