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
    # ':id' is called a route variable
    # the ':' creates the route variable
    # a url variable

    # anything after a '?' is technically not part of the url
    # it is a query string of that url (hashes, keys & values)
    # .../posts/9?whatever=helloworld&foo=bar&key=value

    # DO NOT NEED THIS CODE
    # when user submits data, no matter what form
    # all data ends up in a has called 'params' as part of rack
    raise params.inspect
    # will see all the data passed to my request by the user

    # I want to load the blog post based on the value of id in the URL
    @post = Post.find(params[:id])
    # looks at the params hash for the value of the id key
    # loading that post into the @post variable
    # ':id' is a url variable
    # use ':' to establish the variable
    # anything after '?' is a query string, not part of the url
    # ../posts/9/?whatever=helloworld&foo=bar
    # query hash whatever key, helloworld value
    # data always gets stored in params no matter how it was inputed

    erb :"posts/show.html" # render the posts/show template
    # renders view of selected post
    # convention to use the views rendering the same as the action name
  end

  # WHENEVER WANT TO BUILD A NEW FEATURE IN AN application
  # ASK SELF 2 QUESTIONS
  # Do I need a new URL?
  # Do I need to change my database?
  # Bookends of application
  # - closer to user is the URL
  # - last thing want to give user direct access to is the database
  # - in front of the database are the models
  # access database through ActiveRecord, models/post.rb
  # rake console
  # pry(main)> ActiveRecord::Base.connection.exectue("SELECT * FROM posts")
  # primitive, gives back an array of hashes, not an array of blog posts
  # models sit in front of database,
  # so can type Post.all instead to get back an array of instances.
  # Post.all.to_sql
  # DB - Model - Controller - Views - User
  # Four things you can do to data:
  # Create - POST
  # Retrieve - GET
  # Update - PUT
  # Delete - DELETE
  # ActiveRecord: Object-relational mapping (ORM)
  # maps rows in a database to instances of a class
  # Ruby Classes are to DB Tables as
  # Instances are to DB Rows


  # posts#new action    # ACTION
  # this action does not need data from database
  get '/posts/new' do    # ROUTE / URL

    erb :"posts/new.html"    # VIEW
  end

  # posts#create action


  # posts@edit


  # posts#update



  # posts#destroy

end
