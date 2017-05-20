json.extract! course, :id, :date, :length, :status, :user_id, :teacher_id, :created_at, :updated_at
json.url course_url(course, format: :json)
