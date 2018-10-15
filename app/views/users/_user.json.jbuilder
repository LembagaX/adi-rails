if response.status == 200
  json.user @user, :name, :email
end
