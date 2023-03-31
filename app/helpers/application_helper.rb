# frozen_string_literal: true

module ApplicationHelper
  def is_admin?
    return true if user_signed_in? && (current_user.is_admin == true)

    redirect_to root_path
  end

  def verify_user?
    return true if current_user == @user || current_user.is_admin == true

    redirect_to root_path
  end

  def profile_completed?
    exceptions = %w[reset_password_token reset_password_sent_at remember_created_at is_admin]
    return unless current_user.attributes.except(*exceptions).any? { |_, attributes| attributes.nil? }

    redirect_to edit_user_path(current_user)
  end

  def get_non_empty_release
    release = nil
    release = @wrapper.get_release(rand(1..10_000)) while release.nil? || release.empty? || release.images.nil?
    release
  end

  def resource_name
    :user
  end

  def resource_class
    User
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def wish_not_for_sale; end
end
