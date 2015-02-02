class Occasion < ActiveRecord::Base
	validates :name, presence: true
	has_and_belongs_to_many :contacts

	acts_as_paranoid
end
