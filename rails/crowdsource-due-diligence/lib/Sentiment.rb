require 'Message'

class Sentiment

	def analyze_messages input_array, search_term
		results = { positive: 0, neutral: 0, negative: 0, search_term: nil, messages: [] }
		messages = input_array.map { |msg| Message.new(msg[:content]) }
		messages.each do |msg|
			if msg.matches_search_term?(search_term)
				# use inject
				results[msg.absolute_sentiment] += 1
				results[:messages] << msg.results
			end
		end
		results[:search_term] = search_term
		results.clone
	end

end