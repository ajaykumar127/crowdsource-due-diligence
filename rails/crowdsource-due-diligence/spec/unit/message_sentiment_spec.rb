require 'rails_helper'
require 'MessageSentiment'

describe MessageSentiment do 

	let(:message) { "I am a good programmer and programming is pleasant".split(" ") }

	subject(:message_sentiment) { described_class.new(:positive, message) }

	describe '#find_sentiment' do

		let(:words) { ["good", "pleasant"] }
		let(:score) { 2 }

		it 'records words of matching sentiment type' do 
			expect(message_sentiment.words).to eq words
		end

		it 'increments score for every sentiment hit' do 
			expect(message_sentiment.score).to eq score
		end

	end

end