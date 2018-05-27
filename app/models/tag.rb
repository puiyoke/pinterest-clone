class Tag < ApplicationRecord
    has_many :taggings
    has_many :pins, through: :taggings
end
