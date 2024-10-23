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

get("/square_root/new")do
  erb(:square_root_new)
end

get("/square_root/results")do 
  @root = params.fetch("root_number").to_f
  @root_result = @root **2
end 

get("/payment/new")do
  erb(:payment_new)
end

get("/payment/results")do
  erb(:payment_results)
@apr = params.fetch("apr").to_f / 100
@years = params.fetch("years").to_f
@principal = params.fetch("principal").to_f
@monthly_rate = @apr / 12
@number_months = @years * 12
@payment_result = @principal * (@monthly_rate * (1 + @monthly_rate)** @number_months) / ((1 + @monthly_rate)** @number_months - 1)
end
