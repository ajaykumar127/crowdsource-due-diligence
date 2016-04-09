require 'Word'

class MessageSentiment

	def initialize type, message_words, word_klass=Word
		@message_words = message_words.map { |word| word_klass.new(word, type) }
		@score = 0
		@sentiment_words = []
    verify_words
		calculate_sentiment
	end

	def score
		@score
	end
	# breaking encapsulation to make for easier reading further up the algorithm process.

	def words
		@sentiment_words.clone
	end

	private

	def calculate_sentiment
  	self.score = message_words.length
  	message_words.each { |word| sentiment_words << word.word }
	end

	def verify_words
		message_words.each.with_index do |word, i|
			word.negate if i+1 != message_words.length && message_words[i+1].is_inverter?
    	message_words[i+1].negate if word.is_negator?
    end
		message_words.keep_if { |word| word.counts? }
	end

	attr_writer :score
	attr_reader :message_words, :libs, :sentiment_words

end