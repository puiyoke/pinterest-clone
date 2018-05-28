class Tag < ApplicationRecord
    has_many :taggings
    has_many :pins, through: :taggings
    before_save :downcase_fields

    def downcase_fields
       self.name.downcase!
    end

    def self.search(search)
        if search
            where("name ILIKE ?", "%#{search}%")
        else
            scoped
        end
    end
end