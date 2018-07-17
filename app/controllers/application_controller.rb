class ApplicationController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/") }

  get '/magic/:foo/:bar/:baz' do
    binding.pry
  end

  'magic/1/2/this?name=avi'
  # matches above because it has three variables
  {
    :foo => 1,
    :bar => 2,
    :baz => "this",
    :name => "avi"  #gets added from query
  }

end
