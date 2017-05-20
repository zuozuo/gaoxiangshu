module ApplicationHelper
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
