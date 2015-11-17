class Lessonword < ActiveRecord::Base
	belongs_to :word
	belongs_to :wordanswer
	belongs_to :lesson
end
