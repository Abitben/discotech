module UsersHelper

  def verify_user?
    if current_user == @user || current_user.is_admin == true
      return true 
    else
      redirect_to root_path
    end
  end

end
