require_relative '../spec_helper.rb'
require_relative '../../lib/VectorOperations.rb'
require_relative '../../lib/wektor.rb'


describe "#Coefficients" do 
	it "calculates current vector values "
	pyramid = Hash.new {|h,k| h[k] = Wektor.new(3)}
	x = Array[1,2,4]
	y = Array[0,2,12]
	
	pyramid[0][0] = Wektor.new(3).SetVector([0,0,0])
	pyramid[1][1] = Wektor.new(3).SetVector([2,0,0])
	pyramid[2][2] = Wektor.new(3).SetVector([12,0,0])

	pyramid[0][1] = Wektor.new(3)

	Coefficients(0,1,x,y,pyramid)

	expect(pyramid[0][1]).to eq(Array[-2,2,0])


end