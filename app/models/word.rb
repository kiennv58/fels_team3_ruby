class Word < ActiveRecord::Base
	has_many :lessonwords
	has_many :wordanswers
	belongs_to :category
	
	def correct_answer
		self.wordanswers.where(correct: true).first
	end

end
