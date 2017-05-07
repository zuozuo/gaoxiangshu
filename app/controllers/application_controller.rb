class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  private

  def after_sign_in_path_for(resource)
    if [3, 4].include?(resource.user_type)
      applies_path
    else
      root_path
    end
  end
end
