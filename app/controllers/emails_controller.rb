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
  def send_list_post
    @emails = Email.all.not_blank
    @users = User.all.not_blank
    emails = (@emails + @users).map(&:email).uniq
    emails.each do |email|
      Newsletter.list_post(email).deliver_now!
    end
    flash[:success] = "Tous les emails ont été envoyé!"
    redirect_to '/emails/' and return
  end
end
