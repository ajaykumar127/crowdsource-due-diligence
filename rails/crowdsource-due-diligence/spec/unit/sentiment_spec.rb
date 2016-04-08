require 'rails_helper'
require 'Sentiment'

describe Sentiment do 

	subject(:sentiment) { described_class.new }

	it 'properly sets up results' do 
		expect(sentiment.compute([], 'fun')).to eq ({ positive: 0, neutral: 0, negative: 0, search_term: 'fun', messages: [] })
	end

end