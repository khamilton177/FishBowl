class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy
end
