class Post < ApplicationRecord
  belongs_to :group
  belongs_to :user

  scope :recent, -> { order("created_at DESC")}

end
