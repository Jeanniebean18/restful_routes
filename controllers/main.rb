get "/login" do
  erb :"login"
end

post "/login_validation" do
  user = User.where({email: params["email"]}).first
  
  user_password = BCrypt::Password.new(user.password)
  
  if user_password == params["password"]
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    redirect "/login"
  end
  
end