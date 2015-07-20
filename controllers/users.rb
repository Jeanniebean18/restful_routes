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
    redirect "users/@user.id"
  else
    @error = true
    erb :"users/new"
  end
end

get "/users/:id/edit" do
  @user = User.find(params[:id])
  erb :"users/edit"
end

put "/users/:id" do
  @user = User.find(params[:id])
  @user.name = params[:name]
  @user.email = params[:email]
  
  @user.save
  
  redirect "users/@user.id"
end

get "users/delete" do
  erb :"users/delete"
end

delete "/users" do
  @user = User.find(params[:id])
  @user.destroy
  
  redirect "/users"
end

get "users/:id" do
  @user = User.find(params[:id])
  erb :"user/show"
end