class Wordanswer < ActiveRecord::Base
	belongs_to :word
	has_many :lessonwords
	
end
