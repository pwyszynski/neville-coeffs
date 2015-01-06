require_relative '../spec_helper.rb'
require_relative '../../lib/wektor.rb'
require_relative '../../lib/VectorHelpers.rb'

describe VectorHelpers do
	let(:dummy_class) { Class.new { include VectorHelpers } }

	describe "VectorAsPolynomial" do
		it "converts Vector to latex string expression"
		expect(VectorAsPolynomial(Wektor.new(3))).to eq("")
	end
		
end