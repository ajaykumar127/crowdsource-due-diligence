
class MessageSentiment

	def initialize sentiment_type, message_words, word_klass=Word
		@message_words = message_words.map { |word| word_klass.new(word, sentiment_type) }
		@score = 0
		@sentiment_words = []
		find_sentiment
	end

	def score
		@score
	end
	# here I am breaking encapsulation to make for easier reading further up the algorithm process. Good/bad?

	def words
		@sentiment_words.clone
	end

	private

	def find_sentiment
    message_words.each.with_index { |word, i| message_words[i+1].negate if word.is_negator? || word.is_inverter? }

  	message_words.keep_if { |word| word.counts? }
  	self.score = message_words.length
  	message_words.each { |word| sentiment_words << word }
	end

	attr_writer :score
	attr_reader :message_words, :libs, :sentiment_words

end