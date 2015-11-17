class Lesson < ActiveRecord::Base
	has_many :lessonwords
	belongs_to :category
	belongs_to :user
end
