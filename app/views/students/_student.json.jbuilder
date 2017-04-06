json.extract! student, :id, :name, :age, :score, :created_at, :updated_at
json.url student_url(student, format: :json)
