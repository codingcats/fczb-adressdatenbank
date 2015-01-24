class Institution < ActiveRecord::Base
	validates :postcode, length: { maximum: 5 }
	has_many :contacts
end
