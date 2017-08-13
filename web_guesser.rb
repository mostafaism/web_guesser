require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, locals:{number:SECRET_NUMBER, message:message}

end

def check_guess(g)
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
	else
		nil
	end 
end

