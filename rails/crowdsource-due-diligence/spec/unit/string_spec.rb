require 'rails_helper'
require 'String'

describe String do

	let(:results) {[
										"hello",
										"this",
										"is",
										"dog",
										"hmm",
										"i",
										"have",
										"no",
										"idea",
										"what",
										"im",
										"doing"
								]}

	subject(:string) { described_class.new("Hello! This is dog. Hmm, I have no idea what I'm doing")}

	it 'splits self into words on whitespace and special chars and removes apostrophes' do
		expect(string.to_words).to eq results
	end

end