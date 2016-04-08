class String

	def to_words
		self.downcase.gsub("'", "").split(/[_\W]+/)
	end

end