class UserMailer < ApplicationMailer
    default from: 'ulrichvoitier@yahoo.fr'


  # app/mailers/user_mailer.rb
  # def welcome_reset_password_instructions(user)
  #   mail(to: user.email, subject: 'Welcome to the New Site')
  # end


  def welcome_email(user)
    @user = user 
    @url  = 'http://discotech.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant le destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def confirmation_email(user, order)
    @user = user 
    @url  = 'http://discotech.fr/order' 
    @order = order
    mail(to: @user.email, subject: 'Merci pour votre commande !')
  end

end