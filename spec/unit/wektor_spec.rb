require_relative '../../lib/wektor.rb'

describe Wektor do
	it "is initialised with one argument" do
		expect {
			Wektor.new(2)
		}.to_not raise_error
	end

	it "has the length given as argument in #new" do
		expect(Wektor.new(3).length).to eq(3)
	end

	it "is initialised with zeros fully" do
		expect(Wektor.new(3)).to eq([0,0,0])
	end

	describe "#SetVector" do
		it "sets given array to vector variable" do
			expect(Wektor.new(4).SetVector([1,2,3,4])).to eq([1,2,3,4])
		end

		it "keeps the length intact" do
			expect(Wektor.new(4).SetVector([1,2,3,4]).length).to eq(4)
		end
	end

	describe "#MultiplyBy" do
		let (:result) { Wektor.new(4).SetVector([1,2,3,4]).MultiplyBy(2) }

		it "mutliplies given vector by scalar" do
			expect(result).to eq([2,4,6,8])
		end

		it "keeps the length intact" do
			expect(result.length).to eq(4)
		end
	end

	describe "#DivideBy" do
		let(:result) { Wektor.new(4).SetVector([2,4,6,8]).DivideBy(2) }

		it "divides given vector by scalar" do
			expect(result).to eq([1,2,3,4])
		end

		it "keeps the length intact" do
			expect(result.length).to eq(4)
		end
	end

	describe "#Sub" do
		let(:first) { Wektor.new(4).SetVector([4,3,2,1]) }
		let(:second) { Wektor.new(4).SetVector([3,2,1,0]) }
		let(:result) { first.Sub(second) }

		it "returns new vector" do
			expect(result).to be_a(Wektor)
		end

		it "substract second value from the first" do
			expect(result).to eq([1,1,1,1])
		end

		it "keeps the length intact" do
			expect(result.length).to eq(4)
		end
	end

	describe "#Add" do
		let(:first) { Wektor.new(4).SetVector([4,3,2,1]) }
		let(:second) { Wektor.new(4).SetVector([3,2,1,0]) }
		let(:result) { first.Add(second) }

		it "returns new vector" do
			expect(result).to be_a(Wektor)
		end

		it "adds both vectors" do
			expect(result).to eq([7,5,3,1])
		end

		it "keeps the length intact" do
			expect(result.length).to eq(4)
		end
	end

	describe "#ShiftRight" do
		let(:result) { Wektor.new(4).SetVector([4,3,2,1]).ShiftRight }

		it "shifts the vector right (first value being zero)" do
			expect(result).to eq([0,4,3,2])
		end

		it "keeps the length intact" do
			expect(result.length).to eq(4)
		end
	end
	
end