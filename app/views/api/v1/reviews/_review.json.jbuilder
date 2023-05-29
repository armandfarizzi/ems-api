json.extract! review, :id, :created_at, :updated_at, :employee_id, :rating, :comment
if @is_admin
    json.extract! review, :approved
end