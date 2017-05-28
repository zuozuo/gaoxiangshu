json.extract! course, :id, :user_id, :teacher_id, :created_at, :updated_at, :name
json.url course_url(course, format: :json)
