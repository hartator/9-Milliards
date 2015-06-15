class EmailsController < ApplicationController
  def index
    @emails = Email.all.not_blank
    @users = User.all.not_blank
    if params[:raw]
      if params[:list] == 'newsletter'
        render plain: @emails.map(:email).join("\n")
      elsif params[:list] == 'user'
        render plain: @users.map(:email).join("\n")
      else
        render plain: (@emails + @users).map(&:email).join("\n")
      end
    end
  end
end
