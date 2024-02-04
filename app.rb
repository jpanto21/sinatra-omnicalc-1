require "sinatra"
require "sinatra/reloader"
require "active_support/all"

get("/") do
  redirect("/square/new")
end

get("/square/new") do
  erb(:square)
end

get("/square/results") do
    @number = params.fetch("number").to_f
    @result = @number ** 2
  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/square_root/results") do

  @number = params.fetch("number").to_f
  @result = @number ** 0.5

  erb(:square_root_results)
end

get("/random/new") do
  erb(:random)
end
get("/random/results") do
  @number1 = params.fetch("user_min").to_f
  @number2 = params.fetch("user_max").to_f

  @result =rand(@number1..@number2)
  
  erb(:random_results)
end

get("/payment/new") do
  erb(:payment)

end

get("/payment/results") do
  @apr= params.fetch("user_apr").to_f
  @r = (@apr/100) / 12
  @years = params.fetch("user_years").to_i
  @n = @years * 12
  @principal = params.fetch("user_pv").to_f
  
  @numerator = @r * @principal
  @denominator = 1- (1 + @r) ** -@n

  @result = @numerator/@denominator
  erb(:payment_results)
end
