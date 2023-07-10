class Topic < ApplicationRecord
  
  # Validation
  validates :title, presence: true
  
   # titleの文字数は、1文字から10文字まで
  validates :title,
    length: { minimum: 1, maximum: 10 }
  
end
