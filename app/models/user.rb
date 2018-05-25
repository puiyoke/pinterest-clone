class User < ActiveRecord::Base
    has_secure_password
    enum gender: {not_telling: 0, male: 1, female: 2}
end