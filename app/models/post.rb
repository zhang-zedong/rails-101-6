class Post < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  belongs_to :group

  scope :recent, -> {order("create_at DESC")}
end
