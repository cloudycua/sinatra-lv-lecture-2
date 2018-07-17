class PostsController < ApplicationController
# BUILDING THESE ACTIONS IN THIS CONTROLLER.
# EVERY CONTROLLER SHOULD BE ABOUT ONE RESOURCE
# IT SHOULD IMPLEMENT AROUND 7 ACTIONS AND NO MORE

#  resources #=> What our application is exposing to the world view

#  "photos"

#  GET /photos #=> index, list all the photos
#  GET /photos/1 #=> show, show you a particular photo based on input

#  GET /photos/new #=> new, should present a form for new photos
#  POST /photos #=> create, should add a new photo to my application

#  GET /photos/1/edit #=> edit, should present a form to edit a photo
#  PUT /photos/1 #=> update, should update photo 1

#  DELETE /photos/1 #=> destroy, should delete photo 1


  # Using homepage to list all Blog Posts (breaking convention)
  get '/' do # posts#index action
    @posts = Post.all

    erb :"posts/index.html"
  end

  get '/posts/favorites' do

    # posts with id 2 and 3 are my favorites
    # how do I load only posts 2 and 3?
    # @favorites = Post.where(:id => [2,3])
    @favorites = Post.find([2,3])

    erb :"posts/favorites.html"
  end

  # posts#show action
  get '/posts/:id' do

    # I want to load the blog post based on the value of id in the URL
    @post = Post.find(params[:id])

    erb :"posts/show.html" # render the posts/show template
  end



  # posts#new action


  # posts#create action


  # posts@edit


  # posts#update



  # posts#destroy

end
