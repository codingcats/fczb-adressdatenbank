class Contact < ActiveRecord::Base
    validates :first_name, presence: true
    validates :last_name, presence: true

    has_many :emails
    belongs_to :institution
    accepts_nested_attributes_for :emails, :allow_destroy => true
end
