require 'sinatra'
require 'sinatra/reloader'

@@life = 5
SECRET_NUMBER = rand(101)

get '/' do
  
  if @@life == 0
    @@life = 5
    SECRET_NUMBER = rand(101)
  end

  guess = params["guess"]
  message = check_guess(guess)
  
  if message == "You got it right!"
  	@@life == 0
  end
  
  if guess != nil && guess.to_i != SECRET_NUMBER
    @@life -= 1
  end

  erb :index, locals:{number:SECRET_NUMBER, message:message, life:@@life}
end


def check_guess(g)

  return nil if g == nil

  diff = g.to_i-SECRET_NUMBER
	
  if diff>5
    "Way too high!"
  elsif diff<5 && diff >0
    "Too high!"
  elsif diff == 0
    "You got it right!"
  elsif diff>-5 && diff <0
    "Too low!"
  elsif diff<-5
    "Way too low!"
  end 
end

