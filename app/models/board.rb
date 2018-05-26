class Board < ApplicationRecord
    belongs_to :user
    has_many :groups
    has_many :pins, through: :groups
end