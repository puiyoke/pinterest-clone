class Board < ApplicationRecord
    belongs_to :user
    has_many :groups
    has_many :pins, through: :groups
    validates_presence_of :title
end