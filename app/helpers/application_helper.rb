module ApplicationHelper
  def is_admin?
    if user_signed_in?
      return true if current_user.is_admin == true

      redirect_to root_path

    else
      redirect_to root_path
    end
  end

  def profile_completed?
    exceptions = %w[reset_password_token reset_password_sent_at remember_created_at is_admin]
    return unless current_user.attributes.except(*exceptions).any? { |_, attributes| attributes.nil? }

    redirect_to edit_user_path(current_user)
  end

  def get_non_empty_release
    release = nil
    while release.nil? || release.empty?
      release = @wrapper.get_release(rand(1..10000))
    end
    return release
  end

end
