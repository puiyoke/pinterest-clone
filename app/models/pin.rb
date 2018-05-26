class Pin < ApplicationRecord
belongs_to :user
has_many :groups
has_many :boards, :through => :groups
mount_uploader :image, AvatarUploader
end