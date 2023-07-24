class Post < ApplicationRecord
  #Validation(2-13でlength以下を追加)
  validates :title, presence: true, length: { maximum: 100 }
  validates :body, presence: true, length: { maximum: 255 }
  
  #ActiveStorage
  has_one_attached :image
  #この行を追加する
  has_many :comments, dependent: :destroy
end
