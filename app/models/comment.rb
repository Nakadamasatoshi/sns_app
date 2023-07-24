class Comment < ApplicationRecord
  #validation
  validates :content, presence: true, length: { maximum: 100 }
  #追加された
  belongs_to :post
end
