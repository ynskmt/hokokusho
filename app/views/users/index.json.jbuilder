json.array! @users do |user|
  json.id user.id
  json.last_name user.last_name
  json.first_name user.first_name
end