require_relative '../spec_helper.rb'
require_relative '../../lib/wektor.rb'

describe wektor do
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

end