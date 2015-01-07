require_relative '../spec_helper.rb'
require_relative '../../lib/wektor.rb'

describe Wektor do
	it "initializes with one argument" do
		expect {
			Wektor.new(2)
		}.to_not raise_error
	end

	it "has the length given as argument in #new" do
		expect(Wektor.new(3).coords.length).to eq(3)
	end

	it "is initialized with 0 as default coords" do
		expect(Wektor.new(3).coords).to eq([0,0,0])
	end

	describe "#setVector" do
		it "sets given array to vector coords variable" do
			expect(Wektor.new(4).setVector([1,2,3,4]).coords).to eq([1,2,3,4])
		end

		it "keeps the length intact" do
			expect(Wektor.new(4).setVector([1,2,3,4]).coords.length).to eq(4)
		end
	end

	describe "#MultiplyBy" do
		let (:result) { Wektor.new(4).setVector([1,2,3,4]).MultiplyBy(2) }

		it "multiplies given vector by given number" do
			expect(result.coords).to eq([2,4,6,8])
		end

		it "keeps the length intact" do
			expect(result.coords.length).to eq(4)
		end
	end

	describe "#DivideBy" do
		let(:result) { Wektor.new(4).setVector([2,4,6,8]).DivideBy(2) }

		it "divides given vector by scalar" do
			expect(result.coords).to eq([1,2,3,4])
		end
		
		it "keeps the length intact" do
			expect(result.coords.length).to eq(4)
		end
	end

	describe "#Sub" do
		let(:first) { Wektor.new(4).setVector([4,3,2,1]) }
		let(:second) { Wektor.new(4).setVector([3,2,1,0]) }
		let(:result) { first.Sub(second) }
		
		it "returns new vector" do
			expect(result).to be_a(Wektor)
		end
		
		it "substract second value from the first" do
			expect(result.coords).to eq([1,1,1,1])
		end
		
		it "keeps the length intact" do
			expect(result.coords.length).to eq(4)
		end
	end

	describe "#Add" do
		let(:first) { Wektor.new(4).setVector([4,3,2,1]) }
		let(:second) { Wektor.new(4).setVector([3,2,1,0]) }
		let(:result) { first.Add(second) }
		
		it "returns new vector" do
			expect(result).to be_a(Wektor)
		end
		
		it "adds both vectors" do
			expect(result.coords).to eq([7,5,3,1])
		end
		
		it "keeps the length intact" do
			expect(result.coords.length).to eq(4)
		end
	end

	describe "#shift_right!" do
		let(:result) { Wektor.new(4).setVector([4,3,2,1]).shift_right! }

		it "shifts the vector right with changing the first value to zero" do
			expect(result.coords).to eq([0,4,3,2])
		end

		it "keeps the length intact" do
			expect(result.coords.length).to eq(4)
		end
	end

	describe "#SetFirst" do
		let(:result) { Wektor.new(4).SetFirst(3) }

		it "changes the first number in coords array" do
			expect(result.coords[0]).to eq(3)
		end
	end
	describe "#VectorAsPolynomial" do
	it "converts Vector with no zeros to polynomial string" do
		vector = Wektor.new(3).setVector([4,3,2])
		expect(vector.VectorAsPolynomial).to eq("2x^2 +3x +4")
	end

	it "converts Vector with only ones inside to polynomial string" do
		vector = Wektor.new(3).setVector([1,-1,1])
		expect(vector.VectorAsPolynomial).to eq("x^2 -1x +1")
		end

	it "converts Vector with 1 at beignning and rest zeros to polynomial string" do
		vector = Wektor.new(3).setVector([1,0,0])
		expect(vector.VectorAsPolynomial).to eq("1")
		end	

		it "converts Vector with only zeros to polynomial string" do
		vector = Wektor.new(3).setVector([1,0,0])
		expect(vector.VectorAsPolynomial).to eq("1")
		end	

		it "converts Vector with only zeros to polynomial string" do
		vector = Wektor.new(3).setVector([0,1,0])
		expect(vector.VectorAsPolynomial).to eq(" +x")
		end	
	end
end