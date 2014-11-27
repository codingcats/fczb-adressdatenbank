class Contact < ActiveRecord::Base
    validates :first_name, presence: true
    validates :last_name, presence: true

    accepts_nested_attributes_for :emails
end
