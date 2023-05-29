class Review < ApplicationRecord
    before_create :set_default
    validates_numericality_of :rating, message: "is not a number"
    validates_numericality_of :rating, greater_than: 0
    validates_numericality_of :rating, less_than_or_equal_to: 5

    scope :approved, -> (admin) { 
        if !admin
            where "approved IS true" 
        end
    }

    def set_default
        self.approved = false
        self.id = SecureRandom.uuid
    end
end
