class Occasion < ActiveRecord::Base
	has_and_belongs_to_many :contacts

	acts_as_paranoid
end
