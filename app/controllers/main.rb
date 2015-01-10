#!/bin/env ruby
# encoding: utf-8
require 'sinatra'
require 'calculus'
require 'fileutils'

require_relative '../../lib/VectorOperations.rb'
require_relative '../../lib/wektor.rb'

# sets root as the parent-directory of the current file
set :root, File.join(File.dirname(__FILE__), '..')
# sets the view directory correctly
set :views, Proc.new { File.join(root, "views") }
#sets the public images directory
set :public_folder, Proc.new { File.join(root, "public") }


get '/' do
  erb :index
end

post '/form' do
	num = params[:numberofpoints]
	setX = params[:setofX]
	setY = params[:setofY]

	setX = setX.split(" ").map {|i| Integer(i) }
	setY = setY.split(" ").map {|i| Integer(i) }
	num = num.to_i

	wektor = CalculatePolynomialResult(setX, setY, num)
	text = wektor.VectorAsPolynomial
	image = Calculus::Expression.new(text, :parse => false).to_png
	destination =  File.expand_path("../", Dir.pwd) + "/public/equation.png"
	FileUtils.cp(image, destination)

	"Liczba puntków: #{num}, Zestaw X: #{setX}, Zestaw Y: #{setY} <br> <p>#{text}</p><p><img src=/equation.png alt=\"Equation\">"
end