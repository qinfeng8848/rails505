class GroupRelationship < ApplicationRecord
  #群关系要對群和用户負責，所以群关系belongs_to群和用户
  belongs_to :group
  belongs_to :user
end
