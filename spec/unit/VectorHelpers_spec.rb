require_relative '../spec_helper.rb'
require_relative '../../lib/wektor.rb'
require_relative '../../lib/VectorHelpers.rb'

	before(:all) do
		@dummy = Class.new
		@dummy.extend VectorHelpersModule
	end

	describe "VectorAsPolynomial" do
		it "converts Vector to latex string expression"
		expect(@dummy.VectorAsPolynomial(Wektor.new(3))).to eq("")
	end
		
