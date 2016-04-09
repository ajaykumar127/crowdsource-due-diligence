require_relative 'SentimentLibrary'

class Word

	include SentimentLibrary
	# extract this include eventually

	NEGATORS = ['not', 'isnt', 'arent', 'aint', 'hardly', 'un', 'dont', 'no', 'non']

	def initialize word, sentiment_type
		@word = word
		@libs = get_libs(sentiment_type)
		@counts = is_match?
		@reject_lib = reject_lib
	end

	def counts?
		counts
	end

	def negate
		self.counts = false
	end

	def is_inverter?
		reject_lib.include? word
	end

	def is_negator?
		NEGATORS.include? word
	end

	private

	def is_match?
		libs[:lookup].include? word
	end

	def reject_lib
		libs[:reject]
	end

	def lookup_lib
		libs[:lookup]
	end

	attr_reader :word, :libs
	attr_accessor :counts

end