
class Sentiment

	def initialize
		reset_results
	end

	def compute input_array, search_term
		# messages = input_array.each { |msg| Message.new(msg[:content]) }

		messages.each do |message|
			if message.words.include? search_term
				# do logic
			end
		end

		# now we have an array of message objects
		# modify results based on
		results[:search_term] = search_term
		return results.clone
	end

	private

	attr_reader :results

	def reset_results
		@results = { positive: 0, neutral: 0, negative: 0, search_term: nil, messages: [] }
	end

end