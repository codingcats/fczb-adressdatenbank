class Institution < ActiveRecord::Base
	validates :name, presence: true
	validates :postcode, length: { maximum: 5 }
	has_many :contacts

	acts_as_paranoid
end
