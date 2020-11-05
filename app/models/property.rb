class Property < ActiveRecord::Base
    belongs_to :user
    validates :address, :price, :image, presence: true
end
