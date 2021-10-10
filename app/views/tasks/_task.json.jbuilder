json.extract! task, :id, :name, :description, :status, :user_id, :list_id, :created_at, :updated_at
json.url task_url(task, format: :json)
