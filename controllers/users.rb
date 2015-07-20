get "/users" do
  erb :"users/users"
end

get "/users/new" do
  erb :"users/new"
end

post "/users" do
  the_password = BCrypt::Password.create(params[:password])
  @user = User.create({name: params[:name], email: params[:email], password: the_password})
  
  redirect "users/:id"
end