class User < ActiveRecord::Base
    has_secure_password
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    enum gender: {not_telling: 0, male: 1, female: 2}
end