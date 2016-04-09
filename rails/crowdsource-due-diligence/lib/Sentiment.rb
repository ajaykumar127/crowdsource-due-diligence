require 'Message'

class Sentiment

	def initialize message_klass=Message
		@msg_klass = message_klass
	end

	def analyze_messages array, term
		results = { positive: 0, neutral: 0, negative: 0, search_term: term, messages: [] }
		msgs = array.map { |m| msg_klass.new(m[:content]) }.keep_if { |m| m.matches_search_term?(term) }
		msgs.each { |msg| results[msg.absolute_sentiment] += 1; results[:messages] << msg.results }
		results
	end

	private

	attr_reader :msg_klass

end