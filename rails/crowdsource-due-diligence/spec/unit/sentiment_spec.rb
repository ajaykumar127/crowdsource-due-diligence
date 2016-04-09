require 'rails_helper'
require 'Sentiment'

describe Sentiment do 

	subject(:sentiment) { described_class.new }

	it 'properly sets up results' do 
		expect(sentiment.analyze_messages([], 'fun')).to eq ({ positive: 0, neutral: 0, negative: 0, search_term: 'fun', messages: [] })
	end

	context 'sentiment calculation' do

		describe '#analyze_messages' do
			let(:tweets) {[
	                      {content: 'love my new iphone! <3'},
	                      {content:'The Apple iPhone is a cultural totem'},
	                      {content:'lolz got another iphone'},
	                      {content:'why are iphones so expensive?!'},
	                      {content:'iPhones are soooo cool!'},
	                      {content:'I like pizza'},
	                      {content:'Sometimes I kiss my pillow'},
	                      {content:'This iPhone is a piece of crap'},
	                      {content:'Barney is a dinosaur'},
	                      {content:'I wish my iphone screen wasn\'t broken.. again'},
	                      {content: 'iphone is awesome'}
	                    ]}

	    let(:search_term) {'iPhone'}
	    let(:messages) {[
	    	{positive_score:1, negative_score:0, positive_words:["love"], negative_words:[], absolute_sentiment: :positive, content:"love my new iphone! <3"},
	    	{positive_score:0, negative_score:0, positive_words:[], negative_words:[], absolute_sentiment: :neutral, content:"The Apple iPhone is a cultural totem"},
	    	{positive_score:0, negative_score:0, positive_words:[], negative_words:[], absolute_sentiment: :neutral, content:"lolz got another iphone"},
	    	{positive_score:0, negative_score:1, positive_words:[], negative_words:["expensive"], absolute_sentiment: :negative, content:"why are iphones so expensive?!"},
	    	{positive_score:1, negative_score:0, positive_words:["cool"], negative_words:[], absolute_sentiment: :positive, content:"iPhones are soooo cool!"},
	    	{positive_score:0, negative_score:1, positive_words:[], negative_words:["crap"], absolute_sentiment: :negative, content:"This iPhone is a piece of crap"},
	    	{positive_score:0, negative_score:1, positive_words:[], negative_words:["broken"], absolute_sentiment: :negative, content:"I wish my iphone screen wasn't broken.. again"},
	    	{positive_score:1, negative_score:0, positive_words:["awesome"], negative_words:[], absolute_sentiment: :positive, content:"iphone is awesome"}
	    	]}

	    let(:results) {{ positive: 3, neutral: 2, negative: 3, search_term: search_term, messages: messages }}

			it 'it properly delegates and collects sentiment calculation' do
				expect(sentiment.analyze_messages(tweets, search_term)).to eq results
			end
		end
	end

end