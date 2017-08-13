require 'sinatra'
require 'sinatra/reloader'

n = "The secret number is #{rand(101)}".upcase

get '/' do
  "#{n}"  
end