require 'rails_helper'

describe SentimentAlgorithm do

  let(:tweets) {[
                    'love my new iphone! <3',
                    'The Apple iPhone is a cultural totem',
                    'lolz got another iphone',
                    'why are iphones so expensive?!',
                    'iPhones are soooo cool!',
                    'I like pizza',
                    'Sometimes I kiss my pillow',
                    'This iPhone is a piece of crap',
                    'Barney is a dinosaur',
                    'I wish my iphone screen wasn\'t broken.. again',
                    'iphone is awesome'
                  ]}

  let(:search_term) {'iPhone'}
  let(:search_term_versions) {['iPhone', 'IPHONE', 'iphone', 'Iphone']}
  let(:sentiment_hash) {{ positive: 3, neutral: 2, negative: 3 }}

  subject(:algorithm) { described_class.new(tweets, search_term) }

  describe '#tweet_is_positive' do
    it 'returns true if positive' do
      expect(algorithm.tweet_is_positive('I am cool')).to be true
    end
    it 'returns false if negative' do
      expect(algorithm.tweet_is_positive('I am crap')).to be false
    end
  end

  describe '#tweet_is_negative' do
    it 'returns true if negative' do
      expect(algorithm.tweet_is_negative('I am crap')).to be true
    end
    it 'returns false if positive' do
      expect(algorithm.tweet_is_negative('I am cool')).to be false
    end
  end

  describe '#tweet_is_neutral' do
    it 'returns true if neither positive nor negative' do
      expect(algorithm.tweet_is_neutral('I am Rufus')).to be true
    end
    it 'returns false if positive' do
      expect(algorithm.tweet_is_neutral('I am cool')).to be false
    end
    it 'returns false if negative' do
      expect(algorithm.tweet_is_neutral('I am crap')).to be false
    end
  end

  describe '#compute_twitter_sentiment' do
    it 'takes tweets and a search term and returns a sentiment hash' do
      expect(algorithm.compute_twitter_sentiment).to eq sentiment_hash
    end
  end

end