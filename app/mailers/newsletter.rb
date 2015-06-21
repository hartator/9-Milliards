class Newsletter < ApplicationMailer
  def list_post(email)
    @email = email
    @posts = Post.all
    mail(to: @email, subject: 'Liste des Trouvailles')
  end
end
