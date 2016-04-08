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

end