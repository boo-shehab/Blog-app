require 'rails_helper'

RSpec.describe Like, type: :model do
    let(:user) { User.create(name: 'ahmed', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'bio') }
    let(:post) { Post.create(title: 'title', text: 'text', author: user) }
    let(:like1) { Like.new(post: post, author: user) }
    let(:like2) { Like.new(post: post, author: user) }
  
    describe "#updates_likes_counter" do
      it "increments the likes_counter of the associated post" do
        expect(post.likes_counter).to eq(0)
        like1.save
        like2.save
        expect(post.likes_counter).to eq(2)
      end
    end
  end