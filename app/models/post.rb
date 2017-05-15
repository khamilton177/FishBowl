class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 100 }
  # accepts_nested_attributes_for :comments, allow_destroy: true
end
