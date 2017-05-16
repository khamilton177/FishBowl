class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy

  accepts_nested_attributes_for :profile, allow_destroy: true
  # after_create :build_profile

  # private
  # def build_profile
  #   Profile.create(user_id: self)
  # end
end
