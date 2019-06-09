class Category < ApplicationRecord
	has_many :lost
	has_many :found
end
