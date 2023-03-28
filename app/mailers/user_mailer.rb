class UserMailer < ApplicationMailer
    default from: 'ulrichvoitier@yahoo.fr'

  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://discotech.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant le destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end
end