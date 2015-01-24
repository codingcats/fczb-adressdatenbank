class Institution < ActiveRecord::Base
	validates :institution, length: { maximum: 5 }
	has_many :contacts
end
