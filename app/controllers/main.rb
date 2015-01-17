#!/bin/env ruby
# encoding: utf-8
require 'sinatra'
require 'fileutils'

require_relative '../../lib/VectorOperations.rb'
require_relative '../../lib/wektor.rb'

class MainApp < Sinatra::Base
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
		@text = wektor.VectorAsPolynomial
		@setX2 = setX.to_s
		@setY2 = setY.to_s
		@numofpts = num

		erb :form
	end
end