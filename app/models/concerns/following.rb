module Following
  extend ActiveSupport::Concern

  included do
    # following_relationships talbe
    # follower_id followed_user_id
    # 1           2
    # 1           3
    # 1           4
    # 1           5
    # 1           6
    # For example: 
    # I want to know how many users I followed,
    # so I have to query the following_relationships table through 'follower_id'
    has_many :followed_user_relationships,
              foreign_key: :follower_id,
              class_name: 'FollowingRelationship'
    has_many :followed_users, through: :followed_user_relationships


    # following_relationships talbe
    # follower_id followed_user_id
    # 1           2
    # 3           2
    # 4           2
    # 5           2
    # 6           2
    # For example: 
    # I want to know how many users follow me,
    # so I have to query the following_relationships table through 'followed_user_id'
    has_many :follower_relationships,
              foreign_key: :followed_user_id,
              class_name: 'FollowingRelationship'
    has_many :followers, through: :follower_relationships
  end
  
  def following? user
    followed_user_ids.include? user.id
  end

  def follow user
    followed_users << user
  end

  def unfollow user
    followed_users.delete(user)
  end

  def can_follow? user
    self != user
  end
end