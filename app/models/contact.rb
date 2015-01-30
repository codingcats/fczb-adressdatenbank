class Contact < ActiveRecord::Base
    validates :first_name, presence: true
    validates :last_name, presence: true

    has_many :emails
    belongs_to :institution
    has_and_belongs_to_many :occasions
    accepts_nested_attributes_for :emails, :allow_destroy => true

    acts_as_paranoid

    def occasion_names
      self.occasions.map do | occasion |
        occasion.name
      end
    end

    def email_addresses
      self.emails.map do | email |
        email.value
      end
    end

    def institution
    	if super.present?
    		super
    	else
    		NullObject.new
    	end
    end

end
