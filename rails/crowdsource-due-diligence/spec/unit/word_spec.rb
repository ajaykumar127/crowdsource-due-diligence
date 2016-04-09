require 'rails_helper'
require 'Word'


describe Word do 

	subject(:word) { described_class.new("good", :positive) }

	describe '#negate' do 
		it 'changes #counts? to false' do
			expect{word.negate}.to change{word.counts?}
			expect(word.counts?).to be false
		end
	end

	describe '#is_inverter?' do 
		it 'returns false if word not found in reject lib' do
			expect(word.is_inverter?).to be false
		end

		let(:inverter) { Word.new("awfully", :positive) }
		it 'returns true if word is found in reject lib' do 
			expect(inverter.is_inverter?).to be true
		end
	end

	describe '#counts?' do 
		it 'returns true if match' do
			expect(word.counts?).to be true
		end
		it 'returns false if negated match' do 
			word.negate
			expect(word.counts?).to be false
		end

		let(:non_match) { Word.new("pie", :positive) }

		it 'returns false unless match' do 
			expect(non_match.counts?).to be false
		end
	end

end