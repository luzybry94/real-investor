class User < ActiveRecord::Base
    has_secure_password
    
    validates :name, :username, presence: true
    validates :username, uniqueness: true

    has_many :properties
end
