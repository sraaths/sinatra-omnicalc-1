require "sinatra"
require "sinatra/reloader"

get("/")do
"welcome"
end

get("/square/new")do
  erb(:new_square_calc)
end

get("/square/results") do
  erb(:square_results)
  @the_num = params.fetch("users_number").to_f
  @the_result = @the_num ** 2 
end

get("square_root/new")do
  erb(:square_root_new)
end

get("square_root/results")do 
  @root = params.fetch("root_number").to_f
  @root_result = @root **2
end 
