class Profile < ApplicationRecord
  # 追加された
  belongs_to :user
  
  # Validation
  validates :name, presence: true, length: { maximum: 100 }
  validates :address, presence: true, length: { maximum: 100 }
  validates :age, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :sex, presence: true, length: { maximum: 100 }
  has_one_attached :image

end
