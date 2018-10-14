if response.code == 200
  json.user @user, :name, :email
  json.token @token
end
json.code response.code
