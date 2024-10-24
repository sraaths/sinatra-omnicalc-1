require "sinatra"
require "sinatra/reloader"

get("/")do
"welcome"
end

get("/square/new")do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("users_number").to_f
  @the_result = @the_num ** 2 
  erb(:square_results)
end

get("/square_root/new")do
  erb(:square_root_new)
end

get("/square_root/results")do 
  @root = params.fetch("root_number").to_f
  @root_result = Math.sqrt(@root)
  erb(:square_root_results)
end 

get("/payment/new")do
  erb(:payment_new)
end

get("/payment/results") do
  @apr = (params.fetch("apr").to_f / 100)
  @years = params.fetch("years").to_i
  @principal = params.fetch("principal").to_f  
  @monthly_rate = @apr / 12
  @number_months = @years * 12
  @payment_result = ((@principal * (@monthly_rate * (1 + @monthly_rate)**@number_months) / ((1 + @monthly_rate)**@number_months - 1)).to_fs(:currency))

  @apr1 = (@apr * 100).to_fs(:percentage, {:precision => 4}) 
  @principal1 = @principal.to_fs(:currency)

  erb(:payment_results)
end

get("/random/new")do
  erb(:random_new)
end

get("/random/results")do
  @min = params.fetch("min").to_f
  @max = params.fetch("max").to_f
  @random_result = rand(@min..@max)
    erb(:random_results)
end 
