class Pin < ApplicationRecord
belongs_to :user
has_many :groups
has_many :boards, :through => :groups
has_many :taggings
has_many :tags, through: :taggings
has_many :comments
mount_uploader :image, AvatarUploader

    def self.tagged_with(name)
        Tag.find_by_name!(name).pins
    end

    def self.tag_counts
        Tag.select("tags.*, count(taggings.tag_id) as count").
        joins(:taggings).group("taggings.tag_id")
    end
    
    def tag_list
        tags.map(&:name).join(", ")
    end
    
    def tag_list=(names)
        self.tags = names.split(",").map do |n|
        Tag.where(name: n.strip).first_or_create!
        end
    end

end