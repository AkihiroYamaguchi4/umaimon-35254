class HomeController < ApplicationController
  def index
    @courses = Course.all.order('created_at DESC')
    @chefs = Chef.all.order('created_at DESC')
  end
end
