class User < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy

  scope :admin, ->{where(:admin, true)}
  before_save { self.username = self.username.to_s.downcase }

end
