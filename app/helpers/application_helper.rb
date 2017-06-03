module ApplicationHelper
  def flash_class(level)
    case level
        when :notice then "alert alert-info"
        when :success then "alert alert-success"
        when :error then "alert alert-error"
        when :alert then "alert alert-error"
    end
  end

  def my_path
    if current_user
      case current_user.type
      when 'Student'
        student_path(current_user)
      when 'Teacher'
        teacher_path(current_user)
      else
        user_path(current_user)
      end
    else
      "#"
    end
  end
end
