require 'rails_helper'
require 'Message'

describe Message do

	subject(:message) { described_class.new("Hello! This is dog. Hmm, I have no idea what I'm doing")}

	describe '#matches_search_term?' do 
		it 'matches whole phrases' do 
			expect(message.matches_search_term?('This is dog')).to be true
		end
		it 'matches single words' do 
			expect(message.matches_search_term?('dog')).to be true
		end
		it 'matches single words for plural matches' do 
			expect(message.matches_search_term?('dogs')).to be true
		end
		it 'does not match unrelated words' do 
			expect(message.matches_search_term?('fruit')).to be false
		end
		it 'does not match unrelated phrases' do 
			expect(message.matches_search_term?('brave new world')).to be false
		end
	end

	context 'calculating absolute sentiment' do 
		describe '#initialize' do 
			let(:content) {"I am good and happy, but my friend is not bad, and our enemies are amazingly terrible"}
			subject(:message) { described_class.new(content)}
			let(:results) {{  
												positive_score: 2,
												negative_score: 2,
												positive_words: ["good", "happy"],
												negative_words: ["enemies", "terrible"],
												absolute_sentiment: :neutral,
												content: content
										}}
			it 'correctly calculates and formats results' do 
				expect(message.results).to eq results
			end
		end
	end

end