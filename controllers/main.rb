get "/login" do
  erb :"login"
end

post "/login_validation" do
  user = User.where({email: params["email"]}).first
  
  user_password = BCrypt::Password.new(a)
  
  if params["password"] == user.password
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    session[:user_id] = false
    redirect "/login"
  end
  
end