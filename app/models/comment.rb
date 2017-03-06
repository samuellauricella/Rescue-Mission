class Comment < ApplicationRecord
	validates :title, length: { minimum: 20 }
	validates :body, length: { minimum: 100 }

	belongs_to :question
end