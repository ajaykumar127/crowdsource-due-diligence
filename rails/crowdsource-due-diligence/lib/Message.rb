require 'String'
require 'MessageSentiment'

class Message

	attr_reader :absolute_sentiment, :results

	def initialize content
		@words = content.to_words
		@results = { positive_score: 0, negative_score: 0, positive_words: [], negative_words: [], absolute_sentiment: nil, content: content}
		get_absolute_sentiment(:positive)
		get_absolute_sentiment(:negative)
	end

	def matches_search_term? search_term
		search_term = search_term.downcase.split(" ")
		# TODO: better handling of multiple-item search terms
		# make search term object
    words.any? do |word|
    	search_term.any? do |term|
	      term == word ||
	      term.pluralize == word ||
	     	term == word.pluralize
	    end
    end
	end

	private

	attr_reader :words
	attr_writer :positive_score, :negative_score, :absolute_sentiment

	def get_absolute_sentiment type
		sentiment = MessageSentiment.new(type, words)
		results["#{type}_score".to_sym] = sentiment.score
		results["#{type}_words".to_sym] = sentiment.words
		compare_scores
	end

	def compare_scores
		(self.absolute_sentiment = :positive) if positive_score > negative_score
    (self.absolute_sentiment = :negative) if negative_score > positive_score
    (self.absolute_sentiment = :neutral) if positive_score == negative_score
    results[:absolute_sentiment] = absolute_sentiment
	end

	def positive_score
		results[:positive_score]
	end

	def negative_score
		results[:negative_score]
	end

	def positive_words
		results[:positive_words].clone
	end

	def negative_words
		results[:negative_words].clone
	end

end