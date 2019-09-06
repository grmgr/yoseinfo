class Like < ApplicationRecord
  belongs_to :user
  #あるお気に入りAに関して、お気に入りAをしたユーザーは一人しかいない
  belongs_to :post

  validates :user_id, uniqueness: { scope: :post_id }
end
