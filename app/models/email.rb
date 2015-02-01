class Email < ActiveRecord::Base
	validates :value, presence: true, format: {  with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "Bitte gib eine gültige Email-Adressse an"  }
	belongs_to :contact

	acts_as_paranoid
end
