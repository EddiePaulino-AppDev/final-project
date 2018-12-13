class HomeController < ApplicationController
  before_action :authenticate_user!, :except => [:about_us, :index]

  def index
    @guide = Guide.all

    render("home/index.html.erb", layout: false)
  end


  def about_us
    render("home/about_us.html.erb")
  end
end
