# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'ulrichvoitier@yahoo.fr'


  # app/mailers/user_mailer.rb
  # def welcome_reset_password_instructions(user)
  #   mail(to: user.email, subject: 'Welcome to the New Site')
  # end


  def welcome_email(user)

    # on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user

    # on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://discotech.fr/login'

    @user = user 
    @url  = 'http://discotech.fr/login' 


    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant le destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end
end


  def confirmation_email(user, order)
    @user = user 
    @url  = 'http://discotech.fr/order' 
    @order = order
    mail(to: @user.email, subject: 'Merci pour votre commande !')
  end

end

