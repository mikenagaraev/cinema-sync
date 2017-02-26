class HomeController < ApplicationController
  def index
    @rooms = Room.all
  end

  def about

  end
end
