class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy

  accepts_nested_attributes_for :profile, allow_destroy: true
end
