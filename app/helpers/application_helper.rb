module ApplicationHelper
  def is_admin?
    if user_signed_in?
      if current_user.is_admin == true
        return true
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def profile_completed?
    exceptions = ["reset_password_token", "reset_password_sent_at", "remember_created_at", "is_admin"] 
    if current_user.attributes.except(*exceptions).any? { |_, attributes| attributes.nil? }  
      redirect_to edit_user_path(current_user)
  end

  end
end