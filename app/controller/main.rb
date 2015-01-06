#encoding UTF-8
require 'sinatra'

# sets root as the parent-directory of the current file
set :root, File.join(File.dirname(__FILE__), '..')
# sets the view directory correctly
set :views, Proc.new { File.join(root, "views") } 

get '/' do
  erb :index
end

post '/form' do
	num = params[:numberofpoints]
	setX = params[:setofX]
	setY = params[:setofY]

	num2 = num.to_i+1
	setX2 = setX.split(' ')
	setY2 = setY.split(' ')
	"Liczba puntków: #{num2}, Zestaw X: #{setX2}, Zestaw Y: #{setY2}"
end
