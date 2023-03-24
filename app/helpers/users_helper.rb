module UsersHelper

  def verify_user?
    if current_user == @user
      return true
    else
      redirect_to root_path
    end
  end

end
