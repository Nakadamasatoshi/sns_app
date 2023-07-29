class Comment < ApplicationRecord
  belongs_to :post
  
    # Validation
  validates :content, presence: true, length: { maximum: 100 }

end
