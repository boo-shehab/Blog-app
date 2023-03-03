require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'ahmed', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'bio') }
  let(:post) { Post.create(title: 'title', text: 'text', author: user) }
  let(:comment1) { Comment.new(text: 'comment1', post:, author: user) }
  let(:comment2) { Comment.new(text: 'comment1', post:, author: user) }

  describe '#updates_likes_counter' do
    it 'increments the likes_counter of the associated post' do
      expect(post.comments_counter).to eq(0)
      comment1.save
      comment2.save
      expect(post.comments_counter).to eq(2)
    end
  end
end
