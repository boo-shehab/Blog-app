class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  after_save :updates_comments_counter

  private

  def updates_comments_counter
    post.update(comments_counter: post.comments_counter + 1)
  end
end
