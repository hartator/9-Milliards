class HomeController < ApplicationController
  def index
  end
  def newsletter
    email = Email.new
    email.email = params[:email]
    email.save!
    render json: true
  end
end
