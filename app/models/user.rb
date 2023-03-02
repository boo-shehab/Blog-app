class User < ApplicationRecord
  has_many :like, foreign_key: 'author_id'
  has_many :post, foreign_key: 'author_id'
  has_many :comment, foreign_key: 'author_id'

  private

  def recent_three_posts
    post.order('created_at Desc').limit(3)
  end
end
