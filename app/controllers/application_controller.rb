class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # get '/' do
  #   redirect to '/recipes'
  # end
  
  get '/recipes' do
    @recipes = Recipe.all 
    erb :index
  end
  
  get '/recipes/new' do 
   erb :new
  end 
  
  post '/recipes' do 
   @recipes = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
   redirect "/recipes/#{recipe.id}"
  end   
 
  get '/recipes/:id' do
  @recipes = Recipe.find_by_id(params[:id])
  erb :show
  end
  
  get '/recipes/:id/edit' do
   @recipes = Recipe.find_by_id(params[:id])
   erb :edit
  end  

end
