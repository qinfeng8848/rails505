class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :groups
  has_many :posts
  # 先告訴model我們在群关系中有很多筆資料
  has_many :group_relationships
   # 這些資料是要拿來判斷這個用户有參與多少个群
  has_many :participated_groups, :through => :group_relationships, :source => :group

  def is_member_of?(group)
   participated_groups.include?(group)
  end

  def join!(group)
    participated_groups << group
  end
  
  def quit!(group)
    participated_groups.delete(group)
  end
end
