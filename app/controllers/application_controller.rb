class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  layout :layout_by_resource

  private

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      if current_user
        case current_user.type
        when 'Student', 'Teacher'
          'application'
        else
          'admin'
        end
      else
        "application"
      end
    end
  end

  def after_sign_in_path_for(resource)
    case resource.type
    when 'Student'
      student_path(resource)
    when 'Teacher'
      teacher_path(resource)
    else
      students_path
    end
  end
end
