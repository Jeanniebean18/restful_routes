get "users/:id/stories" do
  @user = User.find(params[:id])
  erb :"stories/stories"
end

get "/users/:id/stories/new" do
  @user = User.find(params[:id])
  erb :"stories/new"
end

post "/stories" do
  @user = User.find(params[:user_id])
  @story = @user.stories.create({name:params[:name], content:params[:content]})
  if @story.valid?
    redirect "/users/#{@user.id}/stories"
  else
    erb :"stories/new"
  end
end

get "/users/:id/stories/edit" do
  @user = User.find(params[:id])
  erb :"stories/edit"
end

put "/stories/:id" do
  @story = Story.find(params[:id])
  @story.name = params[:name]
  @story.content = params[:content]
  @story.save
  redirect "users/#{params[:user_id]}/stories"
end

delete "stories/:user_id/:story_id" do
  @story = Story.find(params[:story_id])
  @story.destroy
  redirect "users/#{params[:user_id]}/stories"
end