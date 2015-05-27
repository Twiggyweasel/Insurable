class User < ActiveRecord::Base
    has_many :rooms
    has_many :homes
    has_many :items
end
