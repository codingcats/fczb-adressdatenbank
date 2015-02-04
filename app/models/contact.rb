class Contact < ActiveRecord::Base
    validates :first_name, presence: true
    validates :last_name, presence: true

    has_many :emails
    belongs_to :institution
    scope :order_institution, ->(direction) { joins("LEFT JOIN 'institutions' ON contacts.institution_id = institutions.id").order("LOWER(institutions.name) #{direction}") }
    scope :order_postcode, ->(direction) { joins("LEFT JOIN 'institutions' ON contacts.institution_id = institutions.id").order("LOWER(institutions.postcode) #{direction}") }
    has_and_belongs_to_many :occasions
    scope :filter_occasions, ->(occasion_ids) { joins("LEFT JOIN 'contacts_occasions' on contacts.id = contacts_occasions.contact_id").where('occasion_id IN (?)', occasion_ids).uniq }
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
