class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comment
  has_many :like

  def updates_posts_counter
    author.update(post_counter: author.post_counter + 1)
  end

  def recent_five_comments
    comment.order(created_at: :desc).limit(5)
  end
end
