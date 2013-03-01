class HomeController < ApplicationController
  def index
  end


  def acerca
      respond_to do |format|
         format.html # show.html.erb
      end
  end
end
