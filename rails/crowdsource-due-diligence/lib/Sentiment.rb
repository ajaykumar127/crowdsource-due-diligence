
class Sentiment

	def initialize
		@results = { positive: 0, neutral: 0, negative: 0, search_term: nil, messages: [] }
	end

	def analyze_messages input_array, search_term
		msgs = input_array.each { |msg| Message.new(msg[:content]) }
		msgs.each do |m| 
			# increment results hash
			self.results[:messages] << m.results if m.matches_search_term?(search_term)
		end
		self.results[:search_term] = search_term
		results.clone
	end

	private

	attr_accessor :results

end