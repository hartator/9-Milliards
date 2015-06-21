class HomeController < ApplicationController
  def index
    @posts = Post.all.desc(:points)
  end
  def newsletter
    email = Email.new
    email.email = params[:email]
    email.save!
    render json: true
  end
end
