require_relative '../spec_helper.rb'
require_relative '../../lib/VectorOperations.rb'


	describe "#Coefficients" do 
		it "calculates current vector values for example from documentations" do
		pyramid = NArray.object(3,3)
		x = Array[1,2,4]
		y = Array[0,2,12]
		
		pyramid[0,0] = Wektor.new(3)
		pyramid[0,0].setVector([0,0,0])
		pyramid[1,1] = Wektor.new(3)
		pyramid[1,1].setVector([2,0,0])
		pyramid[2,2] = Wektor.new(3)
		pyramid[2,2].setVector([12,0,0])

		pyramid[0,1] = Wektor.new(3)

		Coefficients(0,1,x,y,pyramid)

		expect(pyramid[0,1].coords).to eq(Array[-2,2,0])
	end
	end

	describe "#CalculatePolynomialResult" do
		it "it takes two arrays with length 3 and calculates for example from documentations" do
		expect(CalculatePolynomialResult([1,2,4],[0,2,12],3)).to eq([0,-1,1])
		end

		it "it takes two arrays with length 3 and calculates for example from documentations" do
		expect(CalculatePolynomialResult([1,2,4,99],[0,2,12,55],4)).to eq([0, -2, 1, -1])
		end

		it "it takes two arrays with length 3 and calculates for example from documentations" do
		expect(CalculatePolynomialResult([1,2,4,99,6],[0,-2,-12,55,-99],5)).to eq([13, -25, 10, -2, 0])
		end

	end

