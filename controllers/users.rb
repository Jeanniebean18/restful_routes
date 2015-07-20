get "/users" do
  erb :"users/users"
end

get "/users/new" do
  erb :"users/new"
end

post "/users" do
  the_password = BCrypt::Password.create(params[:password])
  @user = User.create({name: params[:name], email: params[:email], password: the_password})
  if @user.valid?
    redirect "users/:id"
  else
    @error = true
    erb :"users/new"
  end
end