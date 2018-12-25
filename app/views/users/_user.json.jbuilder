if response.status == 200
  json.user user, :id, :name, :email, :role
end
