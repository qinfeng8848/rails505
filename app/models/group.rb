class Group < ApplicationRecord
  belongs_to :user
  has_many :posts

   # 先告訴model我們在群关系有很多筆資料
  has_many :group_relationships
   # 這些資料是要拿來判斷這個群有多少成员
  has_many :members, through: :group_relationships, source: :user
end
