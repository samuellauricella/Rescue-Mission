class Question < ApplicationRecord
	validates :title, length: { minimum: 20 }
	validates :description, length: { minimum: 100 }

	has_many :comments
end