class User < ActiveRecord::Base
    has_secure_password
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    enum gender: {not_telling: 0, male: 1, female: 2}
    mount_uploader :avatar, AvatarUploader
    has_many :authentications, dependent: :destroy
       
    def self.create_with_auth_and_hash(authentication, auth_hash)
        user = self.create!(
            email: auth_hash["info"]["email"],
            password: SecureRandom.hex(10)
        )
        user.authentications << authentication
        return user
    end
       
        # grab google to access google for user data
    def google_token
        x = self.authentications.find_by(provider: 'google_oauth2')
        return x.token unless x.nil?
    end
       
end